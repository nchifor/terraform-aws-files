kubernetes.yaml
learning without playing makes Jack a dull boy
# Learning is good for the soul
* London bridge is falling down
* The beautiful ones are not yet born
# An apple a day keeps the doctor away

apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  labels:
    app: nginx
spec:
  containers:
  - name: nginx
    image: nginx:latest
    ports:
    - containerPort: 80
