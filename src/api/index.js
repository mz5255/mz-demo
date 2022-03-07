import request from '../utils/service'
///获得站点统计数据
export function getechartlist (param) {
  if (param.pagesize === undefined) {
    param.pagesize = 32
  }
  if (param.page === undefined) {
    param.page = 1
  }
  return request({
    url: `/ui/SysEchartEntity/queryEchartList`,
    method: 'post',
    data: param,
  })
}

export function getechartdetail (param) {
  return request({
    url: `/ui/SysEchartEntity/getEchartDetail?cid=` + param,
    method: 'get',
  })
}

export function commGetApi (url) {
  return request({
    url: url,
    method: 'get',
  })
}

export function commPostApi (url, param) {
  return request({
    url: url,
    method: 'post',
    data: param,
  })
}
