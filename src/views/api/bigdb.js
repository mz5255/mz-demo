import request from '../utils/service';
///根据ID 获取数据源信息
export function selectById (dbId) {
    return request({
        url: `/ui/bigdbentity/selectById?id=` + dbId,
        method: 'post',
        data: {},
    })
}

///根据ID 删除信息
export function deleteById (dbId) {
    return request({
        url: `/ui/bigdbentity/deleteById?id=` + dbId,
        method: 'post',
        data: {},
    })
}

///查询列表
export function querylist (param) {
    return request({
        url: `/ui/bigdbentity/querylist`,
        method: 'post',
        data: param,
    })
}
///保存数据源方法
export function saveBigDb (param) {
    return request({
        url: `/ui/bigdbentity/save`,
        method: 'post',
        data: param,
    })
}

///查询所有的列表
export function queryAlllist (param) {
    return request({
        url: `/ui/bigdbentity/queryalllist`,
        method: 'post',
        data: param,
    })
}

///测试数据库连接
export function testDbConnection (param) {
    return request({
        url: `/ui/bigdbentity/testconnection`,
        method: 'post',
        data: param,
    })
}
