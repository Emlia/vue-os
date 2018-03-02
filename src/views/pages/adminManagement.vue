<template>
    <div>
        <Button @click="$router.push('adminAdd')">添加测试数据</Button>
        <Button @click="$router.push('adminEdit')">编辑测试数据</Button>
    </div>

</template>

<script>
    export default {
        name: "admin-management"
    }
</script>

<style scoped>

</style>