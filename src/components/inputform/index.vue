<template>
    <div :style="getcss" class="inputform">
        <div class="lable" :style="getlableWidth" :title="lable" v-if="lable !== undefined" :class="required ? 'inputform-required' : ''">
            {{ lable }}
        </div>
        <div class="ctrlContent">
            <slot></slot>
        </div>
    </div>
</template>
<script>
export default {
    props: ['w', 'lw', 'lable', 'required'],
    data() {
        return {}
    },
    computed: {
        getcss() {
            if (this.w !== undefined) {
                return `width:${this.w} ;`
            }
            return `width:250px;`
        },
        getlableWidth() {
            if (this.lw !== undefined) {
                return `width:${this.lw}px;`
            }
            return ``
        },
    },
}
</script>
<style scoped>
.inputform {
    display: flex;
    float: left;
    color: #fff;
    padding-left: 5px;
    padding-right: 5px;
}
.lable {
    width: 80px;
    line-height: 45px;
    min-height: 45px;
    float: left;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.ctrlContent {
    padding-left: 5px;
    line-height: 45px;
    float: left;
    text-align: left;
    min-height: 45px;
}
.inputform-required::before {
    content: '*';
    color: #f56c6c;
    margin-right: 4px;
}
</style>
