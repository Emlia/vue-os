<template>
    <div class="wrapper" @click="clickRadio(value.value)">
        <div class="value" :style="{backgroundColor:state}">{{value.value}}</div>
        <div class="label">{{value.label}}</div>
    </div>
</template>

<script>
    export default {
        name: "radio-item",
        props: {
            value: {
                type: Object,
                default() {
                    return {}
                }
            },
            state: {
                type: String,
                default() {
                    return '#fff';
                }
            }
        },
        methods: {
            clickRadio(value) {
                this.$emit('selectedItem', value)
            }
        }
    }
</script>

<style scoped>
    .wrapper {
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: flex-start;
    }

    .value {
        width: 25px;
        height: 25px;
        line-height: 22px;
        text-align: center;
        font-size: 15px;

        border-radius: 50%;
        border: 2px solid #eee;
        background: #2d8cf0;
    }

    .label {
        margin-left: 15px;
        font-size: 18px;
        width: 80%;
    }
</style>