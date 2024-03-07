import request from "../utils/service";
///查询列表个人组件
export function querylist(param) {
  return request({
    url: `/ui/bigcomentity/querylist`,
    method: "post",
    data: param,
  });
}

///查询列表
export function getShareComEntityList(param) {
  return request({
    url: `/ui/bigcomentity/getShareComEntityList`,
    method: "post",
    data: param,
  });
}

///查询列表
export function getMyBigComEntityList(param) {
  return request({
    url: `/ui/bigcomentity/getMyBigComEntityList`,
    method: "post",
    data: param,
  });
}

///查询列表
export function saveBigComName(param) {
  return request({
    url: `/ui/bigcomentity/saveBigComName`,
    method: "post",
    data: param,
  });
}
///添加
export function savebigcom(param) {
  return request({
    url: `/ui/bigcomentity/save`,
    method: "post",
    data: param,
  });
}

///删除
export function deleteById(param) {
  return request({
    url: `/ui/bigcomentity/deleteById?id=` + param,
    method: "post",
  });
}

///获取对象
export function selectById(param) {
  return request({
    url: `/ui/bigcomentity/selectById?id=` + param,
    method: "post",
  });
}

export function TestExecuteApi(param) {
  return request({
    url: "/ui/common/testExecuteApi",
    method: "post",
    data: param,
  });
}

export function WebApiRequest(param) {
  return request({
    url: "/ui/common/WebApiRequest",
    method: "post",
    data: param,
  });
}

export function getFolderFileInfo(path) {
  return request({
    url: "/ui/common/getFolderFileInfo?path=" + path,
    method: "get",
  });
}
