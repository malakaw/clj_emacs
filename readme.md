
## emacs clojure/python常用配置 

>抛弃了emacs live ,为了用上emacs24.5,自己diy了一下。 


### 使用方式 

参考下面的操作步骤
<pre><code>  
cd ~
wget https://github.com/malakaw/clj_emacs/archive/master.zip
sudo mv .emacs.d .emacs.d_bbak
sudo unzip master.zip
sudo mv emacs_common-master/ .emacs.d
</code></pre>

###clojure
+ cider (0.10.2) 
+ ac-cider (0.2.1)
+ clj-refactor

#### cider
这个版本的debug是个亮点
#####debug
添加断点 C-u C-M-x

删除断点 C-M-x

<pre><code>  

cider-debug tries to be consistent with Edebug. So it makes available the following bindings while stepping through code.

Keyboard shortcut	Description
n	Next step
c	Continue without stopping
o	Move out of the current sexp (like up-list)
i	Inject a value into running code
e	Eval code in current context
l	Inspect local variables
s	Show the current stack
h	Skip all sexps up to “here” (current position). Move the cursor before doing this.
q	Quit execution

</code></pre>


#### clj-refactor
这个功能是比较方便的，原先的版本是没有的，可以自动require
参考：https://github.com/clojure-emacs/clj-refactor.el/wiki
https://github.com/clojure-emacs/clj-refactor.el/tree/master/examples


![https://github.com/clojure-emacs/clj-refactor.el/blob/master/examples/add-missing-libspec.gif](https://github.com/clojure-emacs/clj-refactor.el/blob/master/examples/add-missing-libspec.gif)

#### paredit编辑使用  ####
lisp语言必备的东西，有些快捷方式记录下
<pre><code>  
S-M ' 单词加上双引号
S-M 9 加上小挂号
</code></pre>

![](http://danmidwood.com/assets/animated-paredit/paredit-wrap.gif)


具体参考：http://danmidwood.com/content/2014/11/21/animated-paredit.html


#### lien
配置文件参考下面
<pre><code>  
{:user {:plugins [
                  [cider/cider-nrepl "0.10.2"]
                  [venantius/ultra "0.3.2"]
                  [refactor-nrepl "2.0.0"]
                  ]
        :dependencies [[org.clojure/tools.nrepl "0.2.12"]]
        :ultra {:color-scheme :solarized_dark}
        }
}
</code></pre>




###python
+ elpy
+ flymake-python-pyflakes



### other package list
+ helm
+ multiple-cursors
+ ido
+ desktop
+ window-numbering
+ cua-mode
+ restclient
+ window-numbering


 
## cur-mode使用（列编辑，和emacs live 快捷键还是有点不一样的） ##
<pre><code>  
C-x  列剪贴
C-c  复制
C-v  粘帖
</code></pre>


  
## 窗口大小调整 ##
<pre><code>  
(global-set-key (kbd "C-s-&lt;down&gt;") 'enlarge-window)
(global-set-key (kbd "C-s-&lt;up&gt;") 'shrink-window)
(global-set-key (kbd "C-s-&lt;left&gt;") 'enlarge-window-horizontally)
(global-set-key (kbd "C-s-&lt;right&gt;") 'shrink-window-horizontally)
</code></pre>
按键
Control_Command_(left/right/up/down)
