import http from "k6/http";
import { sleep } from "k6";

export const options = {
 
    stages: [
      { duration: '2m', target: 30 }, // เพิ่ม user จาก 1-100 ภายใน 5 นาที 
      { duration: '20m', target: 30 }, // user 100 คน สามารถคงอยู่ในระบบได้ 5 ชม.
      { duration: '5m', target: 0 }, //ลด user ลงเหลือ 0 คน
    ],
  }

  
export default function () {
    http.get("http://45.144.164.182:8081/");
  sleep(1)
}