import request from '../utils/service'
///获取echart组件
export function getechartlist(param) {
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

export function getechartdetail(param) {
  return request({
    url: `/ui/SysEchartEntity/getEchartDetail?cid=` + param,
    method: 'get',
  })
}
