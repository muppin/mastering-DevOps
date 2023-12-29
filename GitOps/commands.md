- **To create app via cli**
  
       ``` argocd app create app-2 --repo https://github.com/mabusaa/argocd-example-apps.git --path guestbook --dest-namespace app-2 --dest-server https://kubernetes.default.svc --revision master --sync-option CreateNamespace=true
  

  **To list apps**
  
       ``` argocd app list
  

  **To sync app**
  
       ``` argocd app sync app-name


  **To list projects**
  
      ``` kubectl get appproject -n argocd
