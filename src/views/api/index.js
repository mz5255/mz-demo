import request from '../utils/service'
import qs from 'qs'
export function commGetApi (url) {
    return request({
        url: url,
        method: 'get',
    })
}

export function commPostApi (url, param) {
    let ajaxurl = url
    if (param.query !== undefined) {
        ajaxurl = ajaxurl + "?" + qs.stringify(param.query)
    }
    return request({
        url: ajaxurl,
        method: 'post',
        data: param.body,
    })
}

export function testExecuteApi (url, param) {
    return request({
        url: url,
        method: 'post',
        data: param,
    })
}
export function apiComm (apicode, param) {
    return request({
        url: '/ui/common/apicomm/' + apicode,
        method: 'post',
        data: param,
    })
}

export function getNewId () {
    return request({
        url: '/ui/common/getNewId',
        method: 'post',
        data: {},
    })
}
export function getListHeadCell (apicode) {
    return request({
        url: '/ui/common/getListHeadCell/' + apicode,
        method: 'post',
    })
}
export function getApiFieldNames (param) {
    return request({
        url: '/ui/common/getApiFieldNames',
        method: 'post',
        data: param,
    })
}

export function getEnumDic (menuType) {
    return request({
        url: '/ui/common/getDictionaryEnum?menuType=' + menuType,
        method: 'post',
    })
}

export function getBatchDictionaryEnum (param) {
    return request({
        url: '/ui/common/getBatchDictionaryEnum',
        method: 'post',
        data: param,
    })
}

export function ExportExlce (apicode, param) {
    return request({
        url: '/ui/common/ExportExlce/' + apicode,
        method: 'post',
        data: param,
        responseType: 'blob',
    })
}

export function uploadfile (param) {
    return request({
        url: '/ui/common/uploadfile',
        method: 'post',
        data: param,
    })
}

export function uploadImg (param) {
    return request({
        url: '/ui/common/uploadImg',
        method: 'post',
        data: param,
    })
}

export function download (url) {
    return request({
        url: '/ui/common/download?path=' + url,
        method: 'get',
    })
}
export function TestExecuteApi (param) {
    return request({
        url: '/ui/common/testExecuteApi/',
        method: 'post',
        data: param
    })
}

export function getTableColumn (param) {
    return request({
        url: '/ui/common/getTableColumn',
        method: 'post',
        data: param
    })
}

export function getAlltablename (param) {
    return request({
        url: '/ui/common/getAlltablename',
        method: 'post',
        data: param
    })
}

export function testCommApi (apicode, param) {
    return request({
        url: '/ui/common/testCommApi/' + apicode,
        method: 'post',
        data: param,
    })
}

export function ajaxComm (apicode, param) {
    let ajaxurl = '/ui/common/apicomm/' + apicode
    if (param.query !== undefined) {
        ajaxurl = ajaxurl + "?" + qs.stringify(param.query)
    }
    return request({
        url: ajaxurl,
        method: 'post',
        data: param.body
    })
}
