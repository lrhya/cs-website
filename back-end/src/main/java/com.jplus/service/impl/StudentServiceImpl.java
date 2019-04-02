
package com.jplus.service.impl;

import com.jplus.dao.LogDao;
import com.jplus.dao.StudentDao;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.Page;
import com.jplus.entity.Student;
import com.jplus.entity.V_student;
import com.jplus.service.StudentService;
import com.jplus.util.FileUploadUtil;
import com.jplus.util.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2017/9/15.
 */
@Service("StudentService")
public class StudentServiceImpl implements StudentService {
    @Resource
    private StudentDao StudentDao;
    @Resource
    private LogDao logDao;


    /**
     * 添加学生（学生姓名做唯一校验）
     * @param Student
     * @return
     */
    public JsonMessage addStudent(Student Student) {
        if(Student==null|| StringUtil.isBlank(Student.getUsername())){
            return new JsonMessage(false,"请输入学生学号！");
        }
        if(StringUtil.isBlank(Student.getName())){
            return new JsonMessage(false,"学生姓名不能为空！");
        }
        if(Student.getCid()==0){
            return new JsonMessage(false,"请输入学生班级！");
        }
//学生名字是否做唯一校验
//        Student Student1=StudentDao.findStudentByName(Student.getName());
//        if(Student1!=null){
//            return new JsonMessage(false,"该学生姓名已经有人使用！");
//        }
        int result = StudentDao.addStudent(Student);
        if(result != 0){
            return new JsonMessage(true,"添加学生成功！");
        }else{
            return new JsonMessage(false,"添加学生失败！");
        }
    }

    /**
     * 更新学生
     * @param student
     */
    public JsonMessage updateStudent(Student student) {
        if(student==null|| StringUtil.isBlank(student.getName())){
            return new JsonMessage(false,"学生姓名不能为空！");
        }
        if(StringUtil.isBlank(student.getUsername())){
            return new JsonMessage(false,"请输入学生学号！");
        }
        if(student.getCid()==0){
            return new JsonMessage(false,"请输入学生班级！");
        }
        Student student1=StudentDao.findStudentByName(student.getName());
        if(student1!=null&&student1.getId()!=student.getId()){
            return new JsonMessage(false,"该学生姓名已经有人使用！");
        }
        int result = StudentDao.updateStudent(student);
        if(result != 0){
            return new JsonMessage(true,"更新学生成功！");
        }else{
            return new JsonMessage(true,"更新学生失败！");
        }
    }
    public JsonMessage uploadPhoto(Student student,String basePath) {
        //如果学生以前有照片，根据学生id查找图片路径，根据路径删除图片
        V_student v_student = StudentDao.findStudentById(student.getId());
        if(!StringUtil.isBlank(v_student.getPhoto())){
            String photoPath = basePath+v_student.getPhoto();
            FileUploadUtil.deleteFile(photoPath);
        }
        int result = StudentDao.updateStudent(student);
        if(result != 0){
            return new JsonMessage(true,"上传图片成功！");
        }else{
            return new JsonMessage(true,"上传图片失败！");
        }
    }
    public JsonMessage uploadResume(Student student,String basePath) {
        //如果学生以前有简历，根据学生id查找简历路径，根据路径删除简历
        V_student v_student = StudentDao.findStudentById(student.getId());
        if(!StringUtil.isBlank(v_student.getResume())){
            String resumePath = basePath+v_student.getResume();
            FileUploadUtil.deleteFile(resumePath);
        }
        int result = StudentDao.updateStudent(student);
        if(result != 0){
            return new JsonMessage(true,"上传简历成功！");
        }else{
            return new JsonMessage(true,"上传简历失败！");
        }
    }

    /**
     * 跳到更新的学生页面
     * @param id
     */
    public JsonMessage editStudent( int id) {
        if(id==0){
            return new JsonMessage(false,"请选择要更新的学生！");
        }
        V_student Student = StudentDao.findStudentById(id);
        return new JsonMessage(true,Student);
    }

    /**
     * 查询学生
     * @param pageNum
     * @param  pageSize
     */
    public JsonMessage findAllStudentPage(int pageNum,int pageSize) {
        int userCount = StudentDao.getStudentCount();
        Map<String,Integer> param =new HashMap<String, Integer>();

        List<V_student> StudentList = StudentDao.findAllStudent(param);
        if(StudentList ==null ||StudentList.isEmpty()){
            return new JsonMessage(false,"未查到任何学生！");
        }
        Page<V_student> StudentPage = new Page<V_student>(pageSize,pageNum,userCount,StudentList);
        return new JsonMessage(true,StudentPage);
    }



    /**
     * 根据条件查询学生分页
     * @param v_student ,pageNum,size
     * @return
     */
    public JsonMessage findStudentSelective(V_student v_student,int pageNum,int size) {

        int totalRecord=0;
        List<V_student> v_students=null;
        Map<String,Object> map=new HashMap<String,Object>();
        totalRecord=StudentDao.findStuNumSelective(v_student);
        System.out.println(totalRecord);
        Page<V_student> newsPage=new Page<V_student>( size,pageNum, totalRecord, null);
        if(pageNum>newsPage.getTotalPage())
            pageNum=newsPage.getTotalPage();
        if(pageNum<=0)
            pageNum=1;
        newsPage.setCurrentPage(pageNum);
        int start = (pageNum-1)*size;
        map.put("start",start);
        map.put("size",size);
        map.put("v_student",v_student);
        v_students=StudentDao.findStudentSelective(map);
        System.out.println("111:"+v_students);
        if(v_students==null){
            return new JsonMessage(false,"查找学生失败");
        }
        newsPage.setDataList(v_students);
        return new JsonMessage(true,newsPage);
    }

    /**
     * 删除学生
     * @param id
     */
    public JsonMessage deleteStudent( int id,String basePath) {
        if(id==0){
            return new JsonMessage(false,"请选择要删除的学生！");
        }
        V_student student= StudentDao.findStudentById(id);
        FileUploadUtil.deleteFile(basePath+student.getPhoto());
        FileUploadUtil.deleteFile(basePath+student.getResume());
        StudentDao.deleteStudent(id);
        return new JsonMessage(true,student);
    }

    public JsonMessage batchDeleteStus(int[] stuId,String basePath) {
        for(int id:stuId){
            V_student v_student = StudentDao.findStudentById(id);
            //删除学生图片
            if(!StringUtil.isBlank(v_student.getPhoto())){
                String photoPath = basePath+"/photo"+v_student.getPhoto();
                FileUploadUtil.deleteFile(photoPath);
            }
            //删除学生简历
            if(!StringUtil.isBlank(v_student.getResume())){
                String resumePath = basePath+"/resume"+v_student.getResume();
                FileUploadUtil.deleteFile(resumePath);
            }
        }
        if (StudentDao.batchDeleteStus(stuId)) {
            return new JsonMessage(true, "删除学生成功！");
        }
        return new JsonMessage(false, "删除学生失败，请选择要删除的学生！");

    }

}
