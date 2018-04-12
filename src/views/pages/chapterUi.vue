<template>
    <div>
        <navPage></navPage>
        <whiteapce>
            <div class="chapter-wrapper">
                <div class="chapter-item" v-for="(item,index) in chapters" :key="index" @click="click(item.value)">
                    <div class="chapter-icon" :style="{backgroundColor:colors[(index)%colors.length]}">{{item.value}}
                    </div>
                    <div class="chapter-text">{{item.label}}</div>
                </div>
            </div>
        </whiteapce>
    </div>
</template>

<script>
    import navPage from '../components/nav/navPage'
    import whiteapce from '../components/whitespace/whitespace'

    export default {
        name: "chapter-ui",
        components: {navPage, whiteapce},
        data() {
            return {
                colors: ['#FF6666',
                    '#66CC99',
                    '#FF9933',
                    '#9999FF',
                    '#66CC00',
                    '#993399',
                    '#6666FF',]
            }
        },
        mounted() {
            this.$store.commit('getChapters')
        },
        methods: {
            click(id) {
                console.log('chapter-', id)
                this.$store.commit('setChapterId', id)
                this.$router.push('/chapterExercise')
            }
        },
        computed: {
            chapters() {
                return this.$store.state.chapters
            },
        }
    }
</script>

<style scoped>
    .chapter-wrapper {
        width: 100%;
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: flex-start;
        flex-wrap: wrap;
    }

    .chapter-item {
        width: 100%;
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: center;
        margin-top: 10px;
    }

    .chapter-icon {
        font-size: 14px;
        /*border: 1px solid #999;*/
        border-radius: 50%;
        width: 22px;
        height: 22px;
        text-align: center;
        line-height: 22px;
        margin-right: 20px;
        color: #fff;
    }

    .chapter-text {
        font-size: 18px;

    }
</style>