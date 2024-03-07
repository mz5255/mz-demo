import request from '../utils/service'
import qs from 'qs'
// 获取路由
export function getSwaggerResources () {
    return request({
        url: '/swagger-resources',
        method: 'get'
    })
}

export function ajaxswagger (url, param, method) {
    let ajaxurl = url
    if (param.query !== undefined) {
        ajaxurl = ajaxurl + qs.stringify(param.query)
    }
    return request({
        url: ajaxurl,
        method: method === undefined ? 'get' : method,
        data: param.body
    })
}

