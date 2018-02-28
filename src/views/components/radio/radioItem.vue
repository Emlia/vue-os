<template>
    <div>
        <div>{{value.value}}</div>
        <div>{{value.label}}</div>
        <div>??</div>
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
            }
        }
    }
</script>

<style scoped>

</style>