<template>
<!-- 引入布局 -->
   <el-container class="home_contrine">
       <!-- 头部 -->
        <el-header class="el_header">
            <div>
                <img src="../assets/logo.jpg" alt="LOGO">
                <span>运动平台</span>
            </div>
            
            <el-button type="info" @click="logout" class="logout_but">安全退出</el-button>
        </el-header>
        <!-- 主体 -->
            <el-container>
                <!-- 主体侧边栏 -->
                <el-aside :width="isCollapase?'64px':'200px'" class="el_aside">
                    <div class="toggon_button" @click="toggleCollapase">|||</div>
                    <el-menu background-color="#545c64" text-color="#fff" active-text-color="#409eff"
                     unique-opened :collapse="isCollapase" :collapse-transition="false" :router="true" :default-active="activePath">
                        <!-- 一级菜单 -->
                        <el-submenu :index="item.id+''" v-for="item in menuList" :key="item.id">
                            <template slot="title">
                                <i :class="iconsObject[item.id]"></i>
                                <span>{{item.title}}</span>
                            </template>
                            <!-- 二级菜单 -->
                            <el-menu-item :index="it.path" v-for="it in item.sList" :key="it.id" @click="saveNavState(it.path)">
                                <template slot="title">
                                    <i :class="iconsObject[it.id]"></i>
                                    <span>{{it.title}}</span>
                                </template>
                            </el-menu-item>
                        </el-submenu>
                    </el-menu>
                </el-aside>
                <!-- 主体内容 -->
                <el-main class="el_menu">
                    <router-view></router-view>
                </el-main>
            </el-container>
    </el-container>

</template>
<script>
    export default {
        data(){
            return{
                //菜单列表
                menuList:[],
                isCollapase:false,//伸缩属性
                iconsObject:{
                    '100':'iconfont icon-guanliyuan',
                    '200':'iconfont icon-qialuli',
                    '101':'iconfont icon-yundong',
                    '102':'iconfont icon-denglu-copy',
                    '103':'iconfont icon-list-1-copy',
                    '104':'iconfont icon-shu',
                    '201':'iconfont icon-shu',
                    '202':'iconfont icon-mima',
                    '203':'iconfont icon-shiwu-',
                    '204':'iconfont icon-shangpin',
                },
                activePath:'/welcome',//默认路径
            }
        },
        // 页面加载执行的方法
        created(){
            //查询菜单列表
            this.getMenuList();
            this.activePath = window.sessionStorage.getItem('activePath');//取出session里的path动态修改activePath
        },


        methods:{
            logout(){
                window.sessionStorage.clear();//清除Session
                this.$router.push("/login");//回到首页
            },
            // 获取所有的导航菜单
            async getMenuList(){
                const {data:res} = await this.$http.get("menus");
                console.log(res);
                if( res.flag != 200) return this.$message.error("操作列表失败！！！");
                this.menuList = res.menus;
            },
            //控制伸缩菜单
            toggleCollapase(){
                this.isCollapase = !this.isCollapase;
            },
            //保存路径
            saveNavState(activePath){
                window.sessionStorage.setItem('activePath',activePath);//存储在session中
                this.activePath = activePath;
            },
        },
    };
</script>
<style lang="less" scoped>
    .home_contrine {
        height: 100%;
    }
    .el_header {
        background-color: #373d41;
        display: flex;
        justify-content: space-between;// 左右贴边
        padding-left: 0%;// 左边界
        align-items: center;// 水平
        color: #fff;
        font-size: 20px;
        align-content: center;
    }
    .el_header>div{
        display: flex;
        
        align-items: center;// 水平
        color: #fff;
        font-size: 20px;
    }
    .el_header div>span{
        margin-left: 15px;
    }
    .el_aside {
        background-color: #333744;
    }
    .el_aside>el-menu{
        border-right: none;
    }
    .el_main {
        background-color: #eaedf1;
    }
    img{
        width: 55px;
        height: 55px;
    }
    .toggon_button{
        background-color: #4a5064;
        font-size: 10px;
        line-height: 24px;
        color: #fff;
        text-align: center;
        letter-spacing: 0.2em;
        cursor: pointer;
        margin-right: 0;
    }
</style>