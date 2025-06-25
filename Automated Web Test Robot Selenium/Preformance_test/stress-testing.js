import http from "k6/http";
import { sleep } from "k6";

export const options = {
   
    stages: [
      { duration: '5m', target: 200 }, // เพิ่ม user จาก 1-200 ภายใน 5 นาที 
      { duration: '10m', target: 200 }, // user 200 คน สามารถคงอยู่ในระบบได้ 30 นาที
      { duration: '5m', target: 0 }, // ลด user ลงเหลือ 0 คน
    ],
  };
  
export default function () {
    http.get("http://45.144.164.182:8081/");
//   sleep(1)
}
