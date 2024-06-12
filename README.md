# nfs
1. при необходимости изменить ip в vagrant
2. Запускаем vagrant up  ipa  
3. далее:  
   vagrant ssh ipa  
   sudo -i  
   kinit admin  -  пароль Qwerty78

      добавляем сервис:  
   ipa service-add nfs/nfss.alex.lan

   создание пользователя и группы:  
   ipa user-add otus --first otis --last otus --password  
   ipa user-mod otus --password-expiration 20301231000000Z
   ipa group-add nfs_users --desc="NFS users"  
   ipa group-add-member nfs_users --users=otus  
4. запускам vagrant up nfss  
   vagrant ssh nfss
   kinit admin ввоим пароль  
   ipa-getkeytab -s ipa.alex.lan -p nfs/nfs.alex.lan -k /etc/krb5.keytab  
5. vagrant up nfsc