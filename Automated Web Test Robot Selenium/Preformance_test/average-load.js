//  Average-load test เพิ่มเเบบตามปกติ ค่ากลางๆ
import http from "k6/http";
import { sleep } from "k6";

export const options = {
 
  stages: [
    { duration: '2m', target: 10 }, // เพิ่ม user จาก 1-10 ภายใน 2 นาที 
    { duration: '5m', target: 10 }, // user 10 คน สามารถคงอยู่ในระบบได้ 5 นาที
    { duration: '2m', target: 0 }, // ลด user ลงเหลือ 0 คน
  ],
};

export default function () {
  http.get("http://45.144.164.182:8081/");
       sleep(1)
}
