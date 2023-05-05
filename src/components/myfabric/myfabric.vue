<template>
  <canvas id="c" :width="width" :height="height"></canvas>
</template>
<script>
let fabric = new Function(`return fabric`)();
export default {
  props: ['bgImgSrc', 'width', 'height'],
  components: {},
  data () {
    return {
      canvas: null,
      activeMarker: null,
      inMarker: false
    };
  },
  mounted () {

    const canvas = new fabric.Canvas("c", {
      perPixelTargetFind: true, //根据图片大小，而不是边框大小
      selection: false,
      enableRetinaScaling: false,
    });
    this.canvas = canvas;
    this.init()
    const limitHandle = (e) => {
      let delta = new fabric.Point(e.movementX, e.movementY);
      canvas.relativePan(delta);

      let canvasViewPort = canvas.viewportTransform;

      let bottomEndPoint = canvas.height * (canvasViewPort[0] - 1);
      if (canvasViewPort[5] >= 0 || -bottomEndPoint > canvasViewPort[5]) {
        canvasViewPort[5] = canvasViewPort[5] >= 0 ? 0 : -bottomEndPoint;
      }

      let rightEndPoint = canvas.width * (canvasViewPort[0] - 1);
      if (canvasViewPort[4] >= 0 || -rightEndPoint > canvasViewPort[4]) {
        canvasViewPort[4] = canvasViewPort[4] >= 0 ? 0 : -rightEndPoint;
      }
    };

    //画布事件
    canvas.on("mouse:wheel", (opt) => {
      let delta = opt.e.deltaY;
      // 设置最大和最小的缩放比例
      let zoom = canvas.getZoom();
      zoom *= 0.999 ** delta;
      if (zoom > 5) zoom = 5;
      if (zoom < 1) zoom = 1;

      canvas.zoomToPoint(
        {
          x: opt.e.offsetX,
          y: opt.e.offsetY,
        },
        zoom
      );
      this.$emit("zoomend", zoom);
      opt.e.preventDefault();
      opt.e.stopPropagation();
      let e = opt.e;
      limitHandle(e);
    });

    canvas.on("mouse:down", (opt) => {
      let evt = opt.e;
      if (evt.altKey === true) {
        this.canvas.isDragging = true;
        this.canvas.selection = false;
      }
      this.$emit("canvasmousedown", opt);
    });

    canvas.on("mouse:move", function (opt) {
      if (this.isDragging) {
        let e = opt.e;
        limitHandle(e);
      }
    });

    canvas.on("mouse:up", (opt) => {
      this.canvas.setViewportTransform(this.canvas.viewportTransform);
      this.canvas.isDragging = false;
      this.canvas.selection = true;
      this.$emit("canvasmouseup", opt);
    });

    //画布内元素的事件
    canvas.on({
      "object:moving": function (e) {
        e.target.opacity = 0.5;
      },
      "object:modified": (e) => {
        e.target.opacity = 1;
      },
    });

    //画布内鼠标移动事件
    canvas.on({
      "mouse:move": (e) => {
        if (this.activeMarker) {
          const coords = this.activeMarker.lineCoords;
          const vertexArr = ["bl", "br", "tr", "tl"].reduce((prev, cur) => {
            for (let key in coords) {
              let { x, y } = coords[key];
              if (key == cur) {
                prev.push({ x, y });
                return prev;
              }
            }
          }, []);

          const lines = [];
          for (let i = 0; i < vertexArr.length; i++) {
            let v = vertexArr[i];
            let preV;
            if (i === 0) {
              preV = vertexArr[vertexArr.length - 1];
            } else {
              preV = vertexArr[i - 1];
            }
            lines.push({ p1: preV, p2: v });
          }

          const { x, y } = e.e;
          const isOutside = this.checkInRange({ x, y }, lines);

          if (isOutside) {
            this.$emit("objectmouseleave", { marker: this.activeMarker, e });
          } else {
            this.$emit("objectmouseenter", { marker: this.activeMarker, e });
          }
        }
      },
    });
  },
  methods: {
    init () {
      const that = this;
      fabric.Image.fromURL(
        that.bgImgSrc,
        (img) => {
          that.canvas.setBackgroundImage(img, that.canvas.renderAll.bind(that.canvas), {
            scaleX: that.canvas.width / img.width,
            scaleY: that.canvas.height / img.height,
          });
          this.canvas.scaleX = that.canvas.backgroundImage.scaleX;
          this.canvas.scaleY = that.canvas.backgroundImage.scaleY;
          this.$emit("ready");
        },
        {
          //允许跨域
          crossOrigin: "anonymous",
        }
      );

    },
    //创建标注
    createMarker (config, callback) {
      if (typeof config != "object") {
        return;
      }
      //配置标注
      const configMarker = (marker) => {
        marker.set({
          hasControls: config.hasControls,
          hasBorders: config.hasBorders,
          lockMovementX: config.lockMovementX,
          lockMovementY: config.lockMovementY,
          selectable: config.selectable,
          hoverCursor: "pointer",
        });
        marker.on({
          mousedblclick: () => {
            this.$emit("objectdblclick", marker);
          },
          mousedown: () => {
            this.$emit("objectclick", marker);
          },
          moving: (e) => {
            marker.set("hoverCursor", "move");
            this.$emit("objectmoving", { marker, e });
          },
          moved: (e) => {
            this.$emit("objectmoved", { marker, e });
            marker.set("hoverCursor", "pointer");
          },
          mouseover: (e) => {
            this.activeMarker = marker;
            this.$emit("objectmouseover", { marker, e });
          },
          mouseout: (e) => {
            this.$emit("objectmouseout", { marker, e });
          },
          mousemove: (e) => {
            this.$emit("objectmousemove", { marker, e });
          },
        });
      };
      if (
        config.img != null &&
        config.img != "" &&
        typeof config.img == "string"
      ) {
        const imgElement = document.createElement("img");
        imgElement.src = config.img;

        imgElement.onload = () => {
          //图片
          const img = new fabric.Image(imgElement, {
            left: config.left, //X轴的位置
            top: config.top, //Y坐标的位置
            opacity: 1,
          });
          img.type = "image";

          //底板
          const plate = new fabric.Circle({
            left: config.left, //X轴的位置
            top: config.top, //Y坐标的位置
            opacity: 1,
            stroke: "red",
            strokeWidth: 3,
            fill: "",
            radius: config.size,
          });
          plate.type = "plate";

          //文本
          const text = new fabric.Text(config.title, {
            left: config.left, //X轴的位置
            top: config.top - 12, //Y坐标的位置
            fontSize: 12,
            fill: "#F36600",
            fontWeight: "bold",
            textAlign: "right",
          });
          text.type = "text";

          const group = new fabric.Group([plate, text, img], {
            left: config.left, //X轴的位置
            top: config.top, //Y坐标的位置
          });
          configMarker(group);
          typeof callback == "function" && callback(group);
        };
      } else {
        let marker = new fabric.Circle({
          radius: config.size,
          fill: "#f55",
          top: config.top,
          left: config.left,
        });
        configMarker(marker);
        typeof callback == "function" && callback(marker);
      }
    },
    //设置画布鼠标样式
    setCursor (type) {
      this.canvas.set({
        defaultCursor: type,
      });
    },
    //添加标记
    mark (overlay) {
      this.canvas.add(overlay);
    },
    //显示所有覆盖物
    showOverlays () {
      this.canvas.forEachObject((overlay) => {
        overlay.set("opacity", 1);
        this.canvas.renderAll();
      });
    },
    //显示单个覆盖物
    showOverlay (overlay) {
      overlay.set("opacity", 1);
      this.canvas.renderAll();
    },
    //隐藏所有覆盖物
    hiddenOverlays () {
      this.canvas.forEachObject((overlay) => {
        overlay.set("opacity", 0);
        this.canvas.renderAll();
      });
    },
    //隐藏单个覆盖物
    hiddenOverlay (overlay) {
      overlay.set("opacity", 0);
      this.canvas.renderAll();
    },
    //清理所有覆盖物
    clearOverlays () {
      this.canvas.forEachObject((overlay) => {
        this.canvas.remove(overlay);
      });
    },
    //移除单个覆盖物
    removeOverlay (overlay) {
      this.canvas.remove(overlay);
    },
    render () {
      this.canvas.renderAll();
    },
    checkInRange (point, lines) {
      let intersectionCount = 0;
      let { x, y } = point;
      for (let i = 0; i < lines.length; i++) {
        let line = lines[i];
        let { p1, p2 } = line;
        if ((p1.y < y && p2.y < y) || (p1.y >= y && p2.y >= y)) {
          continue;
        } else {
          // 求焦点Sx
          const sx = ((y - p1.y) / (p2.y - p1.y)) * (p2.x - p1.x) + p1.x;
          if (sx >= x) {
            intersectionCount++;
          }
        }
      }
      return intersectionCount % 2 === 0;
    },
  },
  watch: {
    width () {
      this.init()
    },
    height () {
      this.init()
    }
  }
};
</script>
<style scoped></style>
