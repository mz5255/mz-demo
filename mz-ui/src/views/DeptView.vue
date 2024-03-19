<template>
  <div>
    <el-button type="primary" size="small" @click="openSave" plain>新增</el-button>
    <el-table
        :data="deptData"
        style="width: 100%;margin-bottom: 20px;"
        row-key="id"
        border
        default-expand-all
        :tree-props="{children: 'children', hasChildren: 'hasChildren'}">
      <el-table-column
          prop="id"
          label="ID"
          sortable>
      </el-table-column>
      <el-table-column
          prop="deptName"
          label="部门名称"
          sortable>
      </el-table-column>
      <el-table-column
          prop="level"
          label="等级">
      </el-table-column>
      <el-table-column
          prop="path"
          label="地址">
      </el-table-column>
      <el-table-column
          label="操作">
        <template v-slot="scope">
          <el-button type="text" size="small" @click="openUpdate(scope.row)" plain class="el-icon-edit">修改</el-button>
          <el-button type="text" size="small" @click="deleteUser(scope.row.id)" plain class="el-icon-delete-solid">删除</el-button>
        </template>
      </el-table-column>
    </el-table>








    <el-dialog :title="title" :visible.sync="open">
      <el-form :model="saveForm">
        <el-form-item label="上级部门" :label-width="formLabelWidth">
          <el-cascader
              clearable
              v-model="value"
              :options="option"
              :props="{ checkStrictly: true ,value: 'id',label:'deptName'}"
              ></el-cascader>



        </el-form-item>
        <el-form-item label="部门名称" :label-width="formLabelWidth">
          <el-input v-model="saveForm.deptName" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="部门位置" :label-width="formLabelWidth">
          <el-input v-model="saveForm.place" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="部门路径" :label-width="formLabelWidth">
          <el-input v-model="saveForm.path" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>

import axios from "axios";

export default {
  data() {
    return {
      deptData: [],
      open:false,
      value:[],
      saveForm:{
        parentId:'',
      },
      title:'',
      formLabelWidth:"120px",

      option:[],
    }
  },
  methods: {
    deleteUser(vv){
      axios.delete("dept/delete?id="+vv).then(r=>{
        if(r.code ===200){
          this.$message.success("删除成功");
          this.getDepts();
        }else{
          this.$message.error(r.msg);
        }
      })
    },


    openUpdate(row){
      this.option = this.deptData;
      this.open=true;
      this.value = row.id;
      this.title = '修改';
      this.saveForm =row;

    },


    /**
     * // 把空的children数组去掉的方法
     * @param data
     * @returns {*}
     */
    delNull(data){
      // 把控的children数组去掉的方法
      if(data!=null){
        for (var i=0;i<data.length;i++ ){
          if(data[i].children&&data[i].children.length<1){
            data[i].children=undefined;
          }else{
            this.delNull(data[i].children)
          }
        }
      }
      return data;
    },


    save(){
      if(this.title==='新增'){
        if(this.value.length>1){
          this.saveForm.parentId = this.value.pop();
        }

        axios.post("dept/save",this.saveForm).then(r=>{
          if(r.code ===200){
            this.$message.success("添加成功");
            this.open = false;
            this.getDepts();
          }else{
            this.$message.error(r.msg);
          }
        })
      }else{
        if(this.value.length>1){
          this.saveForm.parentId = this.value.pop();
        }else{
          this.saveForm.parentId = this.value[0]
        }
        console.log(this.saveForm)
        axios.put("dept/exit",this.saveForm).then(r=>{
          if(r.code ===200){
            this.$message.success("修改成功");
            this.open = false;
            this.getDepts();
          }else{
            this.$message.error(r.msg);
          }
        })
      }


    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.saveForm = {};
    },

    openSave(){
      this.title = "新增";
      this.option = this.deptData;
      this.open=true;
      this.saveForm = {};
    },
    getDepts(){
      axios.post("dept/list").then(r=>{
        console.log(r)

        let delNull = this.delNull(r.data);
        this.deptData =delNull;
      })
    }
  },
  created() {
    this.getDepts();
  }
}
</script>

<style scoped>

</style>
