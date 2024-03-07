import request from '../utils/service';

export function getPackageInterfaceInfo (param) {
    return request({
        url: '/formpage/getPackageInterfaceInfo',
        method: 'post',
        data: param
    })
}

export function getPackageInfo (param) {
    return request({
        url: '/formpage/selectOne/' + param,
        method: 'post',
        data: {}
    })
}
export function addPackageInfo (param) {
    return request({
        url: '/formpage/add',
        method: 'post',
        data: param
    })
}
export function editPackageInfo (param) {
    return request({
        url: '/formpage/edit',
        method: 'post',
        data: param
    })
}
export function delPackageInfo (id) {
    return request({
        url: '/formpage/del?id=' + id,
        method: 'post'
    })
}
export function getByPageName (param) {
    return request({
        url: '/formpage/getByPageName',
        method: 'post',
        data: param,
    })
}


export function saveApiConfigInfo (param) {
    return request({
        url: '/formapi/saveApiConfigInfo',
        method: 'post',
        data: param
    })
}
export function getApiConfigByCallMethodCode (code) {
    return request({
        url: '/formapi/getApiConfigByCallMethodCode?code=' + code,
        method: 'post'
    })
}

export function getApiConfigById (id) {
    return request({
        url: '/formapi/getApiConfigById?id=' + id,
        method: 'post'
    })
}
export function deleteMappingApiConfig (id) {
    return request({
        url: '/formapi/deleteMapping?id=' + id,
        method: 'post'
    })
}
export function saveConfigShowCelNames (param) {
    return request({
        url: '/formapi/saveConfigShowCelNames',
        method: 'post',
        data: param
    })
}
export function saveShowCtrlWhere (param) {
    return request({
        url: '/formapi/saveShowCtrlWhere',
        method: 'post',
        data: param
    })
}
///清除Api接口
export function clearWebApiCache () {
    return request({
        url: '/formapi/clearWebApiCache',
        method: 'get'
    })
}


///
export function queryApiList (param) {
    return request({
        url: '/formapi/queryApiList',
        method: 'post',
        data: param
    })
}
