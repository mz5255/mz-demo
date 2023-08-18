<template>
  <div class="layouttable" :style="getlayouttablecss()">
    <div class="layouttable-row">
      <div
        class="layouttable-item"
        v-for="(item, index) in itemlist"
        :key="index"
        :style="getwidthcss(item)"
        @click.stop="activeitem = item"
        :class="activeitem.id === item.id ? 'active' : ''"
      >
        <div class="layouttable-content">
          <slot :name="item.id"></slot>
        </div>
        <div class="layouttable-tootarl">
          <div style=" display: flex;">
            <div class="layouttable-action title">父级</div>
            <div
              class="layouttable-action el-icon-back"
              v-if="index !== 0"
              @click="leftmove(index)"
            ></div>
            <div
              class="layouttable-action el-icon-right"
              v-if="index !== itemlist.length - 1"
              @click="rigthmove(index)"
            ></div>
            <div
              class="layouttable-action el-icon-document-copy"
              @click="copyitem(item)"
            ></div>
            <div
              class="layouttable-action el-icon-delete"
              @click="delitem(item)"
            ></div>
          </div>
        </div>
        <div
          class="layouttable-verticalline"
          v-if="index !== itemlist.length - 1"
          @mousedown.prevent.stop="handleZoom($event, index)"
        ></div>
      </div>
    </div>
  </div>
</template>
<script>
import { newid } from '@/views/bgconfig.js'
export default {
  props: ['previewmodel', 'cellist', 'w', 'scale', 'left'],
  data() {
    return {
      height: 100,
      itemlist: [
        { width: 20, phonewidth: 20, ipadwidth: 20, id: 'cel1' },
        { width: 20, phonewidth: 20, ipadwidth: 20, id: 'cel2' },
        { width: 20, phonewidth: 20, ipadwidth: 20, id: 'cel3' },
        { width: 20, phonewidth: 20, ipadwidth: 20, id: 'cel4' },
        { width: 20, phonewidth: 20, ipadwidth: 20, id: 'cel5' },
      ],
      width: 0,
      activeitem: {},
    }
  },
  methods: {
    getlayouttablecss() {
      return 'height:' + this.height + '%'
    },
    getwidthcss(item) {
      return 'width:' + this.getCelWidth(item) + '%'
    },
    getCelWidth(item) {
      switch (this.previewmodel) {
        case 'pc':
          return item.width
        case 'phone':
          return item.phonewidth
        case 'ipad':
          return item.ipadwidth
        default:
          return item.width
      }
    },
    setCelWidth(item, width) {
      switch (this.previewmodel) {
        case 'pc':
          item.width = width
          break
        case 'phone':
          item.phonewidth = width
          break
        case 'ipad':
          item.ipadwidth = width
          break
        default:
          item.width = width
          break
      }
    },
    leftmove(index) {
      // 点击上箭头，获取当前行下标
      this.itemlist.splice(
        index,
        1,
        ...this.itemlist.splice(index - 1, 1, this.itemlist[index])
      )
    },
    rigthmove(index) {
      this.itemlist.splice(
        index,
        1,
        ...this.itemlist.splice(index + 1, 1, this.itemlist[index])
      )
    },
    delitem(item) {
      let idex = this.itemlist.indexOf(item)
      if (idex !== 0) {
        this.itemlist[idex - 1].width =
          this.itemlist[idex - 1].width + item.width
        this.itemlist[idex - 1].phonewidth =
          this.itemlist[idex - 1].phonewidth + item.phonewidth
        this.itemlist[idex - 1].ipadwidth =
          this.itemlist[idex - 1].ipadwidth + item.ipadwidth
      } else {
        this.itemlist[idex + 1].width =
          this.itemlist[idex + 1].width + item.width
        this.itemlist[idex + 1].phonewidth =
          this.itemlist[idex + 1].phonewidth + item.phonewidth
        this.itemlist[idex + 1].ipadwidth =
          this.itemlist[idex + 1].ipadwidth + item.ipadwidth
      }
      this.itemlist.splice(idex, 1)
    },
    copyitem(item) {
      let idex = this.itemlist.indexOf(item)
      let newitem = JSON.parse(JSON.stringify(item))
      newitem.width = newitem.width / 2
      newitem.phonewidth = newitem.phonewidth / 2
      newitem.ipadwidth = newitem.ipadwidth / 2
      item.width = item.width / 2
      item.phonewidth = item.phonewidth / 2
      item.ipadwidth = item.ipadwidth / 2
      newitem.id = newid('sel')
      this.itemlist.splice(idex, 0, newitem)
    },
    handleZoom(doc, index) {
      let left = this.$store.state.bgconfig.left
      let scale = this.scale
      let oldw = this.getCelWidth(this.itemlist[index])
      let oldnextw = this.getCelWidth(this.itemlist[index + 1])
      const move = (e) => {
        let x = Math.round(
          (e.clientX -
            (left - document.getElementById('canvas-wp').scrollLeft)) /
            scale
        )

        let mw = Number(((x - this.left) * 100) / this.w)
        let w = 0
        for (let i = 0; i < index; i++) {
          w = w + this.getCelWidth(this.itemlist[i])
        }
        this.setCelWidth(this.itemlist[index], mw - w)

        if (this.getCelWidth(this.itemlist[index]) <= 0) {
          this.setCelWidth(this.itemlist[index], 0)
          this.setCelWidth(
            this.itemlist[index + 1],
            this.getCelWidth(this.itemlist[index + 1]) + oldw
          )
        } else {
          this.setCelWidth(
            this.itemlist[index + 1],
            oldnextw - Number(this.getCelWidth(this.itemlist[index]) - oldw)
          )
        }
        this.$forceUpdate()
      }
      const up = () => {
        document.removeEventListener('mousemove', move, false)
        document.removeEventListener('mouseup', up, false)
      }

      document.addEventListener('mousemove', move, false)
      document.addEventListener('mouseup', up, false)
    },
    handleParentZoom(doc) {
      let oldh = this.height
      let oldmouseY = doc.clientY
      const move = (e) => {
        let mh = e.clientY
        this.height = oldh + mh - oldmouseY
        if (this.height <= 0) {
          this.height = 0
        }
        this.$forceUpdate()
      }
      const up = () => {
        document.removeEventListener('mousemove', move, false)
        document.removeEventListener('mouseup', up, false)
      }

      document.addEventListener('mousemove', move, false)
      document.addEventListener('mouseup', up, false)
    },
  },
  created() {
    if (this.cellist !== undefined) {
      this.itemlist = this.cellist
    }
    this.width = this.w
  },
  watch: {
    cellist: {
      deep: true,
      handler() {
        if (this.cellist !== undefined) {
          this.itemlist = this.cellist
        }
      },
    },
    w() {
      this.width = this.w
    },
  },
}
</script>
<style scoped>
.layouttable {
  width: 100%;
  float: left;
  /* margin-top: 5px; */
}
.layouttable .layouttable-row {
  height: 100%;
  border: 1px solid #4294ff;
  position: relative;
  /* top: 5px;
  margin: 0px 5px; */
  display: flex;
}

.layouttable-verticalline {
  width: 5px;
  height: 30%;
  border: 1px solid #4294ff;
  background-color: #4294ff;
  right: 0px;
  position: absolute;
  top: 50%;
  min-height: 20px;
  max-height: 80px;
  transform: translateY(-50%);
  cursor: w-resize;
  display: none;
}
.layouttable-horizontalline {
  width: 30%;
  height: 5px;
  border: 1px solid #4294ff;
  background-color: #4294ff;
  bottom: 0px;
  position: absolute;
  left: 50%;
  min-width: 20px;
  max-width: 80px;
  transform: translateX(-50%);
  cursor: s-resize;
  display: none;
}
.layouttable .layouttable-row .layouttable-item {
  width: 20%;
  height: 100%;
  position: relative;
  float: left;
  border: 1px dotted #4294ff;
}
.layouttable .layouttable-content {
  width: 100%;
  height: 100%;
  overflow: auto;
  display: inline-block;
  overflow-x: hidden;
}
.layouttable .layouttable-row .layouttable-item .layouttable-tootarl {
  position: absolute;
  top: -23px;
  width: 100%;
  height: 20px;
  min-width: 110px;
  display: none;
  cursor: pointer;
}
.layouttable
  .layouttable-row
  .layouttable-item
  .layouttable-tootarl
  .layouttable-action {
  width: 20px;
  height: 20px;
  color: #fff;
  margin: 0;
  display: inline-block;
  vertical-align: middle;
  background-color: #4294ff;
  border: 0.5px solid rgba(255, 255, 255, 0.637);
  float: right;
}
.layouttable
  .layouttable-row
  .layouttable-item
  .layouttable-tootarl
  .layouttable-action.title {
  font-size: 8px;
  width: 30px;
  float: left;
}

.layouttable-item.active .layouttable-tootarl {
  display: block !important;
}
.layouttable .layouttable-row .layouttable-item:hover .layouttable-verticalline,
.layouttable
  .layouttable-row
  .layouttable-item:active
  .layouttable-verticalline,
.layouttable
  .layouttable-row
  .layouttable-item:hover
  .layouttable-horizontalline,
.layouttable
  .layouttable-row
  .layouttable-item:active
  .layouttable-horizontalline,
.layouttable-verticalline:hover {
  display: block !important;
}
.layouttable:hover .layouttable-horizontalline,
.layouttable:active .layouttable-horizontalline {
  display: block;
}
</style>
