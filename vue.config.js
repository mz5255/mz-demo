const path = require('path')
const resolve = dir => {
  return path.join(__dirname, dir)
}
const shell = require('shelljs')
const prod = process.env.npm_lifecycle_event
shell.cp(`./src/configs/${prod}.js`, './src/configs/index.js')
module.exports = {
  publicPath: './',
  runtimeCompiler: true,
  chainWebpack: config => {
    config.resolve.alias.set('_c', resolve('src/components')) // key,value自行定义，比如.set('@@', resolve('src/components'))
  },
  configureWebpack: () => {
    const myConfig = {}
    myConfig.plugins = []
    myConfig.devServer = {
      disableHostCheck: true, //  禁用webpack热重载检查 解决热更新失效问题
      host: 'localhost',
      port: 8083,
      https: false,
      proxy: {
        '/jd': {
          // 要请求的后台地址113.240.220.22\http://localhost:8181/net3vs
          target: 'http://localhost:8085/js/a/',
          ws: true, // 启用websockets
          changeOrigin: true, // 是否跨域
          pathRewrite: {
            '^/jd': '' // 这里理解成用路径中的‘/dev/api’代替target里面的地址，后面组件中我们掉接口时直接用api代替
          }
        }
      }
    }
    return myConfig
  }
}
