import request from '../utils/service'
///查询列表
export function querylistbigtemplate (param) {
    return request({
        url: `/ui/bigtemplateentity/querylist`,
        method: 'post',
        data: param,
    })
}

///修改
export function savebigtemplate (param) {
    return request({
        url: `/ui/bigtemplateentity/save`,
        method: 'post',
        data: param,
    })
}



///删除
export function deleteByIdbigtemplate (param) {
    return request({
        url: `/ui/bigtemplateentity/deleteById?id=` + param,
        method: 'post',
    })
}

///获取对象
export function selectByIdbigtemplate (param) {
    return request({
        url: `/ui/bigtemplateentity/selectById?id=` + param,
        method: 'post',
    })
}
///修改大屏名称
export function saveBigTemplateName (param) {
    return request({
        url: `/ui/bigtemplateentity/saveBigTemplateName`,
        method: 'post',
        data: param,
    })
}
