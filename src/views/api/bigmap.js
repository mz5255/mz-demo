import request from '../utils/service'
///查询列表
export function querylistbigmap(param) {
  return request({
    url: `/ui/bigmapentity/querylist`,
    method: 'post',
    data: param,
  })
}

///修改
export function savebigmap(param) {
  return request({
    url: `/ui/bigmapentity/update`,
    method: 'post',
    data: param,
  })
}

///删除
export function deleteByIdbigmap(param) {
  return request({
    url: `/ui/bigmapentity/deleteById?id=` + param,
    method: 'post',
  })
}

///获取对象
export function selectByIdbigmap(param) {
  return request({
    url: `/ui/bigmapentity/selectById?id=` + param,
    method: 'post',
  })
}

export function test(code) {
  return request({
    url: `/ui/bigmapentity/test?code=` + code,
    method: 'get',
  })
}
export function savemapfile(param) {
  return request({
    url: `/ui/bigmapentity/savemapfile`,
    method: 'post',
    data: param,
  })
}

export function getmapjson(param) {
  return request({
    url: `/ui/bigmapentity/getmapjson?id=` + param,
    method: 'get',
  })
}
