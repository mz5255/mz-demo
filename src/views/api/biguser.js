import request from '../utils/service'
///查询列表
export function querylist(param) {
  return request({
    url: `/ui/sysuserentity/querylist`,
    method: 'post',
    data: param,
  })
}

///添加
export function add(param) {
  return request({
    url: `/ui/sysuserentity/add`,
    method: 'post',
    data: param,
  })
}
///修改
export function update(param) {
  return request({
    url: `/ui/sysuserentity/update`,
    method: 'post',
    data: param,
  })
}

///删除
export function deleteById(param) {
  return request({
    url: `/ui/sysuserentity/deleteById?id=` + param,
    method: 'post',
  })
}

///获取对象
export function selectById(param) {
  return request({
    url: `/ui/sysuserentity/selectById?id=` + param,
    method: 'post',
  })
}

///登录
export function login(param) {
  return request({
    url: `/ui/sysuserentity/login`,
    method: 'post',
    data: param,
  })
}

///登录
export function GetCurrentUserInfo() {
  return request({
    url: `/ui/sysuserentity/GetCurrentUserInfo`,
    method: 'post',
    data: {},
  })
}
