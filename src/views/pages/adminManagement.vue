<template>
    <div class="wrapper">
        <navPage></navPage>
        <whitesapce>
            <!--<div class="cell">-->
                <!--<div class="tag">test</div>-->
                <!--<div>-->
                    <!--<Button class="btn" @click="$router.push('adminAdd')">添加测试数据</Button>-->
                    <!--<Button class="btn" @click="$router.push('adminEdit')">编辑测试数据</Button>-->
                    <!--<Button class="btn" @click="$router.push('adminAdd')">添加测试数据</Button>-->
                    <!--<Button class="btn" @click="$router.push('adminEdit')">编辑测试数据</Button>-->
                    <!--<Button class="btn" @click="$router.push('adminAdd')">添加测试数据</Button>-->
                    <!--&lt;!&ndash;<Button class="btn" @click="$router.push('adminEdit')">编辑测试数据</Button>&ndash;&gt;-->
                <!--</div>-->
            <!--</div>-->
            <div class="cell">
                <div class="tag">用户(user)</div>
                <div>
                    <Button class="btn" @click="$router.push('QAdd')">添加数据</Button>
                    <Button class="btn" @click="$router.push('QEdit')">编辑数据</Button>
                    <Button class="btn" @click="$router.push('QAll')">获取所有数据</Button>
                    <!--<Button class="btn" @click="$router.push('adminAdd')">电脑端操作</Button>-->
                </div>
            </div>
            <div class="cell">
                <div class="tag">问题(question)</div>
                <div>
                    <Button class="btn" @click="$router.push('QAdd')">添加数据</Button>
                    <Button class="btn" @click="$router.push('QEdit')">编辑数据</Button>
                    <Button class="btn" @click="$router.push('QAll')">获取所有数据</Button>
                    <!--<Button class="btn" @click="$router.push('adminAdd')">电脑端操作</Button>-->
                </div>
            </div>
            <div class="cell">
                <div class="tag">标签(tag)</div>
                <div>
                    <Button class="btn" @click="$router.push('TAdd')">添加数据</Button>
                    <Button class="btn" @click="$router.push('TEdit')">编辑数据</Button>
                    <Button class="btn" @click="$router.push('TAll')">获取所有数据</Button>
                    <!--<Button class="btn" @click="$router.push('adminAdd')">电脑端操作</Button>-->
                </div>
            </div>
            <div class="cell">
                <div class="tag">章节(chapter)</div>
                <div>
                    <Button class="btn" @click="$router.push('QAdd')">添加数据</Button>
                    <Button class="btn" @click="$router.push('QEdit')">编辑数据</Button>
                    <Button class="btn" @click="$router.push('QAll')">获取所有数据</Button>
                    <!--<Button class="btn" @click="$router.push('adminAdd')">电脑端操作</Button>-->
                </div>
            </div>
            <div class="cell">
                <div class="tag">答案(answer)</div>
                <div>
                    <Button class="btn" @click="$router.push('QAdd')">添加数据</Button>
                    <Button class="btn" @click="$router.push('QEdit')">编辑数据</Button>
                    <Button class="btn" @click="$router.push('QAll')">获取所有数据</Button>
                    <!--<Button class="btn" @click="$router.push('adminAdd')">电脑端操作</Button>-->
                </div>
            </div>
        </whitesapce>

    </div>

</template>

<script>
    import whitesapce from '../components/whitespace/whitespace'
import navPage from '../components/nav/navPage'
    export default {
        components: {whitesapce,navPage},
        name: "admin-management"
    }
</script>

<style scoped>
    .wrapper {
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: flex-start;
        width: 100%;
    }

    .cell {
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: flex-start;
        padding-bottom: 10px;
        margin-bottom: 10px;
        border-bottom: #eee 1px solid;
    }

    .tag {
        font-size: 18px;
        border-left: #2db7f5 4px solid;
        padding-left: 5px;
        margin-bottom: 10px;
    }

    .btn {
        margin: 5px 5px;
    }
</style>