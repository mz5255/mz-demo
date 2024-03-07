import request from '../utils/service'
///查询列表
export function querylist(param) {
  return request({
    url: `/ui/bigmedia/querylist`,
    method: 'post',
    data: param,
  })
}

///添加
export function add(param) {
  return request({
    url: `/ui/bigmedia/add`,
    method: 'post',
    data: param,
  })
}
///修改
export function update(param) {
  return request({
    url: `/ui/bigmedia/update`,
    method: 'post',
    data: param,
  })
}

///删除
export function deleteById(param) {
  return request({
    url: `/ui/bigcomentity/deleteById?id=` + param,
    method: 'post',
  })
}

///获取对象
export function selectById(param) {
  return request({
    url: `/ui/bigcomentity/selectById?id=` + param,
    method: 'post',
  })
}
