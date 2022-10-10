
[1mFrom:[0m /home/ec2-user/environment/D_square/app/controllers/public/homes_controller.rb:25 Public::HomesController#search:

     [1;34m9[0m: [32mdef[0m [1;34msearch[0m
    [1;34m10[0m:   @subject = params[[33m:subject[0m]
    [1;34m11[0m:   [32mif[0m @subject == [31m[1;31m"[0m[31mユーザ[1;31m"[0m[31m[0m
    [1;34m12[0m:     display_users = [1;34;4mUser[0m.where([35mvalid_status[0m: [1;36mtrue[0m).where.not([35mdisplay_status[0m: [1;36mfalse[0m)
    [1;34m13[0m:     [32mif[0m display_users.where(params[[33m:medium_id[0m]).exists?
    [1;34m14[0m:       @display_users = display_users.where(params[[33m:medium_id[0m]).where([31m[1;31m"[0m[31mname like?[1;31m"[0m[31m[0m, [31m[1;31m"[0m[31m%#{params[:word]}[0m[31m%[1;31m"[0m[31m[0m).page(params[[33m:page[0m]).per([1;34m10[0m)
    [1;34m15[0m:     [32melse[0m
    [1;34m16[0m:       @display_users = display_users.where([31m[1;31m"[0m[31mname like?[1;31m"[0m[31m[0m, [31m[1;31m"[0m[31m%#{params[:word]}[0m[31m%[1;31m"[0m[31m[0m).page(params[[33m:page[0m]).per([1;34m10[0m)
    [1;34m17[0m:     [32mend[0m
    [1;34m18[0m:     binding.pry
    [1;34m19[0m:   [32melsif[0m @subject == [31m[1;31m"[0m[31m投稿[1;31m"[0m[31m[0m
    [1;34m20[0m:     @posts = [1;34;4mPost[0m.all.where([31m[1;31m"[0m[31mtitle like? OR introduction like?[1;31m"[0m[31m[0m,[31m[1;31m"[0m[31m%#{params[:word]}[0m[31m%[1;31m"[0m[31m[0m, [31m[1;31m"[0m[31m%#{params[:word]}[0m[31m%[1;31m"[0m[31m[0m).page(params[[33m:page[0m]).per([1;34m10[0m)
    [1;34m21[0m:       [1;34m#if _post.user.valid_status == true && _post.user.display_statua != false[0m
    [1;34m22[0m:   [32melse[0m
    [1;34m23[0m:     []
    [1;34m24[0m:   [32mend[0m
 => [1;34m25[0m: [32mend[0m

