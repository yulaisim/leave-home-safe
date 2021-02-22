# 安心回家

一個以安心出行為例嘅 PWA

## 聲明 [22-02-2021]

呢個係原本GitLab Project嘅fork，目前update咗Dockerfile俾大家可以更加方便咁deploy啦。
功能上面都暫時無乜野要補充嘅，遲啲會盡量整個似安心出行嘅介面，加埋自願save紀錄嘅功能，方便大家應付老細或者政府囉。

## Local Host

```javascript
npm ci
npm run start
```
然後可以用 https://localhost:3000 上啦。

## Remote Host

首先用Docker build & host container：
```
docker build --tag leave-home-safe .
docker run -p 80:80 leave-home-safe
```

由於self-signed certificate對remote host無乜用（Browser唔會認嘅），所以而家嘅dockerfile無咗openssl啦。如果要用https嘅話，最簡單嘅方法係喺host nginx再開個configuration file指去你嘅domain，加呢個location block：

```
location / {
    proxy_pass http://localhost/
}
```
然後裝certbot，等certbot自己搞ssl & certificates。

直接用Cloudflare flexible ssl都可以嘅，只要你唔介意cloudflare到server呢段無https咪得囉。

## Contribution

由於呢個project已經俾香港政府「定性」咗做違法，所有想contribute嘅手足們就要留心資訊安全啦，唔建議你地用有自己資料同projects嘅account submit pull request。

## Copyright

GPL version 3 licensed
Maintained by Ms. Yu Lai Sim from Good Hope School
Respect to codogob and all original contributors