# coding: utf-8
from audioop import reverse

from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect
from django.utils.decorators import method_decorator
from django.core.urlresolvers import reverse
from django.views.generic import ListView
from django.views.generic.detail import DetailView

from core.models import Post, Comment


class AuthenticationMixin:

    def dispatch(self, request, *args, **kwargs):
        if not request.user.is_anonymous:
            return super(AuthenticationMixin, self).dispatch(request, *args, **kwargs)
        else:
            redirect_url = reverse('index_posts')
            return redirect(redirect_url)


class ListPost(ListView):
    model = Post
    context_object_name = 'posts'
    template_name = 'core/post/list.html'
    # paginate_by = 10


class PostsIndex(ListPost):

    def get_queryset(self):
        qs = super(PostsIndex, self).get_queryset().exclude(rating__lt=10)
        if not self.request.user.is_authenticated():
            return qs.exclude(is_private=True)
        return qs

index_posts = PostsIndex.as_view()


class Posts(AuthenticationMixin, ListPost):
    pass

posts = Posts.as_view()


class PostDetail(DetailView):

    model = Post
    template_name = 'core/post/detail.html'

    def get_context_data(self, **kwargs):
        context = super(PostDetail, self).get_context_data(**kwargs)
        context['comments'] = Comment.objects.filter(post=self.object).order_by('-created_at')
        return context

post_detail = PostDetail.as_view()

# return render()
# class