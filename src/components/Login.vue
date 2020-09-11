<template>
    <div class="login_container">
        <!-- 登录块 -->
        <div class="login_box">
            <!-- Login -->
            <div class="avator_box">
                <img src="../assets/logo.png" alt="logo">
            </div>
            <!-- 表单区域 -->
            <el-form ref="loginFromRef" :model="loginFrom" :rules="loginRules" class="login_from" label-width="0">
                <!-- 用户名 -->
                <el-form-item prop="username">
                    <el-input v-model="loginFrom.username" prefix-icon="iconfont icon-denglu-copy"></el-input>
                </el-form-item>
                <!-- 密码 -->
                <el-form-item prop="password">
                    <el-input v-model="loginFrom.password" prefix-icon="iconfont icon-mima" type="password"></el-input>
                </el-form-item>
                <!-- 按钮 -->
                <el-form-item class="btns">
                    <el-button type="primary" @click="login">提交</el-button>
                    <el-button type="info" @click="resetLoginForm">重置</el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            //表单数据对象
            loginFrom:{
                username:"admin",
                password:"123456",
            },
            //验证对象
            loginRules:{
                //检验用户名
                username:[
                    { required: true, message: '请输入用户名', trigger: 'blur' },//必填项验证
                    { min: 5, max: 12, message: '长度在 5 ~ 12 个字符', trigger: 'blur' }//长度验证
                ],
                //校验密码
                password:[
                    { required: true, message: '请输入用户名密码', trigger: 'blur' },//必填项验证
                    { min: 6, max: 12, message: '长度在 6 ~ 12 个字符', trigger: 'blur' }//长度验证
                ],
            },
        };
    },
    methods:{
        //重置表单内容
        resetLoginForm() {
            this.$refs.loginFromRef.resetFields();
        },
        //处理登录的方法
        login(){
            // console.log("ewrw");
            //1.验证检验规则
            this.$refs.loginFromRef.validate(async valid =>{
                if(!valid) return;//2.验证失败
                const{data:res} = await this.$http.post("login",this.loginFrom);//3.访问后台
                if(res.flag == "ok"){
                    this.$message.success("操作成功！！！");//4.成功信息提示
                    this.$router.push({path:"/home"});//6.页面路由跳转
                    window.sessionStorage.setItem("user",res.user);//存储user对象
                }else{
                    this.$message.error("操作失败！！！");//5.错误提示
                }
            });
        },
    },
}
</script>
<style lang="less" scoped>
    .login_container{
        display: flex;
        flex-direction: row;
        flex-wrap: nowrap;
        justify-content:center;
        align-items:center;
        align-content:center;
        background-color: #2b4b6b;
        height: 100%;
    }
    .login_box{
        display: flex;
        justify-content:space-around;
        align-items:center;
        align-content:center;
        width: 600px;
        height: 400px;
        background-color: #fff;
        border-radius: 3px;
    }
</style>