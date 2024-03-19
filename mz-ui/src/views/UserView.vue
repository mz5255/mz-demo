<template>
  <div>
    <el-form :inline="true" :model="queryParam" class="demo-form-inline" @keydown.enter.native="handleQuery">
      <el-form-item label="用户名">
        <el-input v-model="queryParam.userName" placeholder="用户名"></el-input>
      </el-form-item>
      <el-form-item label="昵称">
        <el-input v-model="queryParam.nickName" placeholder="昵称"></el-input>
      </el-form-item>
      <el-form-item label="性别">
        <el-radio-group v-model="queryParam.sex" @change="handleQuery ">
          <el-radio-button label="">
            全部
          </el-radio-button>
          <el-radio-button label="0">
            男
          </el-radio-button>
          <el-radio-button label="1">
            女
          </el-radio-button>
        </el-radio-group>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" size="small" @click="handleQuery">查询</el-button>
      </el-form-item>
    </el-form>

    <el-button type="primary" class="el-icon-plus" size="small" plain @click="openAdd">新增</el-button>
    <el-button type="primary" size="small" plain @click="handleQuery" align="center">刷新</el-button>
    <el-table
        v-loading="loading"
        :data="userData"
        border
        style="width: 100%">
      <el-table-column
          align="center"
          prop="userId"
          label="用户ID">
      </el-table-column>
      <el-table-column
          align="center"
          prop="userName"
          label="用户名称">
      </el-table-column>
      <el-table-column
          align="center"
          prop="nickName"
          label="昵称">
      </el-table-column>
      <el-table-column
          align="center"
          label="性别">
        <template v-slot="scope">
          <el-tag v-if="scope.row.sex==0">男</el-tag>
          <el-tag v-else-if="scope.row.sex==1">女</el-tag>
        </template>
      </el-table-column>
      <el-table-column
          align="center"
          prop="createTime"
          label="出生日期">
      </el-table-column>
      <el-table-column
          align="center"
          prop="email"
          label="邮箱">
      </el-table-column>
      <el-table-column
          align="center"
          prop="phonenumber"
          label="电话">
      </el-table-column>
      <el-table-column
          align="center"
          label="操作">
        <template v-slot="scope">
          <el-button type="text" size="small" @click="openUpdate(scope.row)" plain class="el-icon-edit">修改</el-button>
          <el-button type="text" size="small" @click="deleteUser(scope.row.userId)" plain class="el-icon-delete-solid">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-pagination
        align="center"
        @size-change="handleSize"
        @current-change="handleNum"
        :current-page="queryParam.pageNum"
        :page-sizes="[5, 10, 20, 50]"
        :page-size="100"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total">
    </el-pagination>

    <el-dialog :title="title" :visible.sync="dialogFormVisible">
      <el-form :model="form" @keydown.native.enter="submit">
        <el-form-item label="用户名称" :label-width="formLabelWidth">
          <el-input v-model="form.userName" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="用户昵称" :label-width="formLabelWidth">
          <el-input v-model="form.nickName" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="用户性别" :label-width="formLabelWidth">
          <el-radio v-model="form.sex" label="0">男</el-radio>
          <el-radio v-model="form.sex" label="1">女</el-radio>
        </el-form-item>

        <el-form-item label="出生日期" :label-width="formLabelWidth">
          <el-date-picker
              v-model="form.createTime"
              value-format="yyyy-MM-dd HH:mm:ss"
              type="datetime"
              placeholder="选择出生日期">
          </el-date-picker>
        </el-form-item>

        <el-form-item label="email" :label-width="formLabelWidth">
          <el-input v-model="form.email" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="电话" :label-width="formLabelWidth">
          <el-input v-model="form.phonenumber" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">取 消</el-button>
        <el-button type="primary" @click="submit">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      userData: [],
      queryParam:{
        pageNum:1,
        pageSize:5
      },
      total:0,
      loading:false,
      form:{
        sex:""
      },
      dialogFormVisible:false,
      formLabelWidth:'120px',
      title:""
    }
  },
  methods: {
    handleQuery(){
      this.queryParam.pageNum=1;
      this.query();
    },
    handleSize(pageSize){
      this.queryParam.pageSize=pageSize;
      this.query();
    },
    handleNum(pageNum){
      this.queryParam.pageNum=pageNum;
      this.query();
    },
    query(){
      this.loading=true
      axios.post("user/list",this.queryParam).then(r=>{
        if (r.code == 200){
          this.userData = r.data.list;
          this.total=r.data.total;
          this.loading=false
        }
      })
    },
    openAdd(){
      this.title="新增用户";
      this.dialogFormVisible = true;
    },
    submit(){
      if (this.form.userId == null){
        axios.post("user/addUser",this.form).then(r=>{
          if (r.code == 200){
            this.form={sex:0};
            this.handleQuery();
            this.$message.success("新增成功")
            this.dialogFormVisible=false;
          }
        })
      }else {
        axios.put("user/updateUser",this.form).then(r=>{
          if (r.code == 200){
            this.form={sex: 0};
            this.handleQuery();
            this.$message.success("修改成功")
            this.dialogFormVisible=false;
          }
        })
      }
    },
    cancel(){
      this.title="";
      this.form={sex: 0};
      this.dialogFormVisible=false;
    },
    openUpdate(obj){
      this.form = obj;
      this.title="修改用户";
      console.log(this.form)
      this.dialogFormVisible = true;
    },
    deleteUser(id){
      axios.delete("user/deleteUser?userId="+id).then(r=>{
        if (r.code == 200){
          this.$message.success("删除成功");
          this.handleQuery();
        }
      })
    }
  },
  created() {
    this.handleQuery();
  }
}
</script>

<style scoped>

</style>