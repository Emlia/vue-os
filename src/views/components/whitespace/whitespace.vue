<template>
    <div class="ws-wrapper" @click="$emit('click')">
        <slot></slot>
    </div>
</template>

<script>
    export default {
        name: "whitespace"
    }
</script>

<style scoped>
    .ws-wrapper {
        width: 100%;
        padding: 30px 10px;
    }
</style>