export default {
    created() {
        console.log(this.$route)
        if (this.$route.path.includes('admin')) {
            if (this.$store.state.user.username !== 'admin') {
                this.$router.replace('/login')
                this.$Message.error('仅管理员可进入该页面')
            }
        } else {
            if (this.$store.state.user.id === 0) {
                this.$router.replace('/login')
            }
        }

    }
}