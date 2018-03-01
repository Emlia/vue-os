<template>
    <div class="wrapper" @click="$emit('click')">
        <slot></slot>
    </div>
</template>

<script>
    export default {
        name: "whitespace"
    }
</script>

<style scoped>
    .wrapper {
        margin: 30px 10px;
    }
</style>