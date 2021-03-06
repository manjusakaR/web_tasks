$blog_a=Array.new
$b_search=Array.new
$msg=''
class Blog
  attr_accessor :id
  attr_accessor :message
  attr_accessor :author
  attr_accessor :created_at
  @@b_id=0

  def initialize(msg, aut)
    @id=@@b_id
    @@b_id+=1
    @message=msg
    @author=aut
    @created_at=Time.now
  end

  def Blog.add_blog(b_new)
    $msg=''
    if b_new.author==""&&b_new.message.size<10
      $msg='author_name is nil and the length of message is less than 10'
    elsif b_new.author==""
      $msg='author_name is nil'
    elsif b_new.message.size<10
      $msg='the length of message is less than 10'
    else
      $blog_a+=blog_new=[[b_new.id,b_new.message,b_new.author,b_new.created_at]]
      $b_search=$blog_a
      $msg='add message sucessfilly'
    end
    b_new.id
  end

  def Blog.search_by_id(id,blog_a)
    b_id=Array.new
    i=0
    blog_a.each{ |ba|
      if id==ba[0]
        i=1
        b_id+=[ba]
        break
      end
      }
      if i==0
        $msg='no such id can search'
      else
        $msg='success searched'
      end
      b_id
  end

  def Blog.search_by_author(aut,blog_a)
    b_aut=Array.new
    i=0
    blog_a.each{ |ba|
      if aut==ba[2]
        i=1
        b_aut+=[ba]
      end
    }
    if i==0
      $msg='no such author can search'
    else
      $msg='success searched'
    end
    b_aut
  end

  def Blog.delete_blog(id,blog_a)
    num=0
    msg=''
    id.each{ |b|
        blog_a.each{ |ba|
          if b[1].to_i==ba[0]
            num+=1
            blog_a.delete(ba)
            break
          end
        }
      }
      if num==0
        $msg='Warning, No such message here you can delete!'
      else
        $msg="You success to delete #{num} message/s."
      end
  end

end
