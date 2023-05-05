const path = require("path")
const resolve = (dir) => {
    return path.join(__dirname, dir)
}
const shell = require("shelljs")
const prod = process.env.npm_lifecycle_event
shell.cp(`./src/configs/${prod}.js`, "./src/configs/index.js")

// gzip压缩插件
const CompressionWebpackPlugin = require('compression-webpack-plugin')

// 代码打包之后取出console.log压缩代码
const TerserPlugin = require('terser-webpack-plugin')

// 图形化打包详情
const BundleAnalyzer = require('webpack-bundle-analyzer').BundleAnalyzerPlugin
const cdn = {
    // 忽略打包的第三方库
    externals: {
        // 'ELEMENT': 'element-ui',
        // 'VueRouter': 'vue-router',
        // axios: 'axios',
        // echarts: 'echarts'
    }
}
module.exports = {
    publicPath: "./",
    runtimeCompiler: true,
    lintOnSave: false,
    productionSourceMap: prod !== 'build',
    chainWebpack: (config) => {
        config.resolve.alias.set("_c", resolve("src/components")) // key,value自行定义，比如.set('@@', resolve('src/components'))
        const svgRule = config.module.rule('svg')
        svgRule.exclude.add(resolve('src/icons')).end()
        config.module
            .rule('icons')
            .test(/\.svg$/)
            .include.add(resolve('src/icons'))
            .end()
            .use('svg-sprite-loader')
            .loader('svg-sprite-loader')
            .options({
                symbolId: 'icon-[name]',
            })
            .end();
        // 配置cdn引入
        config.plugin('html').tap((args) => {
            args[0].cdn = cdn
            return args
        })
        if (prod === 'build') {
            // 移除prefetch插件，避免加载多余的资源
            config.plugins.delete('prefetch')
            // 压缩响应的app.json返回的代码压缩
            config.optimization.minimize(true)
            config.plugin('define').tap((args) => {
                // .env
                args[0]['process.env'].BASE_URL = JSON.stringify(process.env.BASE_URL)
                return args
            })
        }
    },
    configureWebpack: () => {
        const myConfig = {}
        myConfig.plugins = []
        myConfig.devtool = "cheap-module-source-map"
        myConfig.devServer = {
            disableHostCheck: true, //  禁用webpack热重载检查 解决热更新失效问题
            host: "localhost",
            port: 8083,
            https: false,
            proxy: {
                "/jd": {
                    // 要请求的后台地址113.240.220.22\http://localhost:8181/net3vs
                    target: "http://localhost:8086/",
                    ws: true, // 启用websockets
                    changeOrigin: true, // 是否跨域
                    pathRewrite: {
                        "^/jd": "", // 这里理解成用路径中的‘/dev/api’代替target里面的地址，后面组件中我们掉接口时直接用api代替
                    },
                },
            },
        }
        // 生产环境配置
        if (prod === 'build') {
            // // 忽略打包配置
            myConfig.externals = cdn.externals
            // 代码压缩去除console.log
            myConfig.plugins.push(
                new TerserPlugin({
                    terserOptions: {
                        ecma: undefined,
                        warnings: false,
                        parse: {},
                        compress: {
                            drop_console: true,
                            drop_debugger: false,
                            pure_funcs: ['console.log'], // 移除console
                        },
                    },
                })
            )
            // 展示打包图形化信息
            myConfig.plugins.push(new BundleAnalyzer())

            // 开启gzip压缩
            myConfig.plugins.push(
                new CompressionWebpackPlugin({
                    filename: (info) => {
                        return `${info.path}.gz${info.query}`
                    },
                    algorithm: 'gzip',
                    threshold: 10240, // 只有大小大于该值的资源会被处理 10240
                    test: new RegExp('\\.(' + ['js'].join('|') + ')$'),
                    minRatio: 0.8, // 只有压缩率小于这个值的资源才会被处理
                    deleteOriginalAssets: false, // 删除原文件
                })
            )
            // 公共代码抽离
            myConfig.optimization = {
                splitChunks: {
                    cacheGroups: {
                        vendor: {
                            chunks: 'all',
                            test: /node_modules/,
                            name: 'vendor',
                            minChunks: 1,
                            maxInitialRequests: 5,
                            minSize: 0,
                            priority: 100,
                        },
                    },
                },
            }
        }
        myConfig.devtool = "source-map"
        return myConfig
    },
}
