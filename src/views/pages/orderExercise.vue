<template>
    <div>
        <whitespace>
            <div>顺序练习</div>
            <div>选择题</div>
            <div>这是一段文字,这是一段文字,这是一段文字,
                这是一段文字,这是一段文字,
                这是一段文字,这是一段文字,这是一段文字
            </div>
            <radio/>
        </whitespace>
    </div>
</template>

<script>
    import radio from '../components/radio/radio'
import whitespace from '../components/whitespace/whitespace'
    export default {
        name: "order-exercise",
        components: {radio,whitespace}
    }
</script>

<style scoped>

</style>