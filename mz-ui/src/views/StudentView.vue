<template>
  <div>
    <el-row>
      <el-col span="1"><el-button type="primary" class="el-icon-plus" @click="handleAdd" size="small" plain>新增</el-button></el-col>
    </el-row>

    <el-table
        :data="stuData">
      <el-table-column type="expand">
        <template v-slot="props">
          <el-form label-position="right" inline class="demo-table-expand">
            <el-form-item label="学号">
              <span>{{ props.row.stuId }}</span>
            </el-form-item>
            <el-form-item label="学生姓名">
              <span>{{ props.row.stuName }}</span>
            </el-form-item>
            <el-form-item label="性别">
              <span>{{ props.row.gender }}</span>
            </el-form-item>
            <el-form-item label="入学日期">
              <span>{{ props.row.inDate }}</span>
            </el-form-item>
            <el-form-item label="创建时间">
              <span>{{ props.row.createTime }}</span>
            </el-form-item>
            <el-form-item label="所选科目">
              <span>{{ props.row.subs }}</span>
            </el-form-item>

          </el-form>
        </template>
      </el-table-column>
      <el-table-column
          prop="stuName"
          label="姓名">
      </el-table-column>
      <el-table-column
          prop="gender"
          label="性别">
      </el-table-column>
      <el-table-column
          prop="inDate"
          label="入学日期">
      </el-table-column>
      <el-table-column
          label="操作">
        <template v-slot="scope">
          <el-button type="text" size="small" @click="handleUpd(scope.row.stuId)" class="el-icon-edit">修改</el-button>
          <el-button type="text" size="small" @click="handleDel(scope.row.stuId)" style="color: red" class="el-icon-delete">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog :title="title" :visible.sync="open">
      <el-form :model="form">
        <el-form-item label="姓名" :label-width="formWidth">
          <el-input v-model="form.stuName" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="性别" :label-width="formWidth">
          <el-radio v-model="form.gender" label="男">男</el-radio>
          <el-radio v-model="form.gender" label="女">女</el-radio>
        </el-form-item>
        <el-form-item label="入学时间" :label-width="formWidth">
          <el-date-picker
              v-model="form.inDate"
              type="date"
              value-format="yyyy-MM-dd"
              placeholder="入学时间">
          </el-date-picker>
        </el-form-item>

        <el-form-item label="姓名" :label-width="formWidth">
          <el-button type="primary" @click="selectSub" size="small" plain>选择学科</el-button>
        </el-form-item>

        <el-table
            :data="form.ids"
            height="180">
          <el-table-column
              sortable
              prop="subId"
              label="编号">
          </el-table-column>
          <el-table-column
              prop="subName"
              label="科目">
          </el-table-column>
          <el-table-column
              prop="hours"
              sortable
              label="课时">
          </el-table-column>
          <el-table-column
              label="操作">
            <template v-slot="scope">
              <el-button
                  @click="form.ids.splice(scope.$index, 1)"
                  type="text"
                  size="small">
                <font color="red">移除</font>
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">取 消</el-button>
        <el-button type="primary" @click="submit">确 定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="学科" :visible.sync="dialogTableVisible">
      <center>
        <el-table :data="subList" height="250" style="width: 300px;" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55"></el-table-column>
          <el-table-column property="subName" label="学科"></el-table-column>
          <el-table-column property="content" label="描述"></el-table-column>
        </el-table>
        <div>
          <el-button type="info" @click="dialogTableVisible =false">取消</el-button>
          <el-button type="primary" @click="yes">确定</el-button>
        </div>
      </center>
    </el-dialog>
  </div>
</template>

<script>

import axios from "axios";

export default {
  data() {
    return {
      stuData: [],
      open:false,
      title:"",
      formWidth:'120px',
      form:{},
      dialogTableVisible: false,
      subList:[],
      selected:[],
    }
  },
  methods: {
    handleDel(stuId){
      this.$confirm('此操作将永久删除该学生信息, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        axios.delete("stu/delStu?stuId="+stuId).then(r=>{
          if (r.code == 200){
            this.$message.success("删除成功");
            this.stuList();
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '取消删除'
        });
      });
    },
    handleUpd(stuId){
      this.title="修改学生信息";
      axios.get("stu/getStuVo?stuId="+stuId).then(r=>{
        this.form = r.data;
        this.open = true;
      })
    },
    yes(){
      this.form.ids = this.selected;
      this.dialogTableVisible = false;
    },
    selectSub(){
      this.subs();
      this.dialogTableVisible = true;
    },
    subs(){
      axios.get("sub/list").then(r=>{
        this.subList = r.data;
      })
    },
    stuList(){
      axios.post("stu/list").then(r=>{
        this.stuData=r.data;
      })
    },
    handleAdd(){
      this.title="新增学生信息";
      this.reset();
      this.open = true;
    },
    reset(){
      this.form={};
    },
    cancel(){
      this.title = "";
      this.reset();
      this.open = false;
    },
    submit(){
      if (this.form.stuId == null){
        axios.post("stu/addStu",this.form).then(r=>{
          if (r.code == 200){
            this.$message.success("新增成功");
            this.stuList();
            this.open=false;
          }
        })
      }else {
        axios.put("stu/updStu",this.form).then(r=>{
          if (r.code == 200){
            this.$message.success("修改成功");
            this.stuList();
            this.open=false;
          }
        })
      }
    },
    handleSelectionChange(val){
      this.selected = val;
    }
  },
  created() {
    this.stuList();
  }
}
</script>

<style>
.demo-table-expand {
  font-size: 0;
}
.demo-table-expand label {
  width: 90px;
  color: #99a9bf;
}
.demo-table-expand .el-form-item {
  margin-right: 0;
  margin-bottom: 0;
  width: 50%;
}
</style>