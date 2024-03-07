import request from '../utils/service'
///查询列表
export function querybiggrouplist(param) {
  return request({
    url: `/ui/biggroupentity/querylist`,
    method: 'post',
    data: param,
  })
}

///添加
export function savebiggroup(param) {
  return request({
    url: `/ui/biggroupentity/save`,
    method: 'post',
    data: param,
  })
}

///删除
export function deleteByIdbiggroup(param) {
  return request({
    url: `/ui/biggroupentity/deleteById?id=` + param,
    method: 'post',
  })
}

///获取对象
export function selectByIdbiggroup(param) {
  return request({
    url: `/ui/biggroupentity/selectById?id=` + param,
    method: 'post',
  })
}
