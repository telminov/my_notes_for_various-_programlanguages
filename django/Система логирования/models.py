
class BaseMongoLogUserInfo(mongoengine.EmbeddedDocument):
    id = mongoengine.IntField(help_text=u'идентификатор пользователя')
    username = mongoengine.StringField(max_length=255, verbose_name=u'Логин в системе')
    ip = mongoengine.StringField(max_length=30, verbose_name=u'Ip адрес')

    def __unicode__(self):
        return self.username
        

class RequestLog(mongoengine.Document):
    user = mongoengine.EmbeddedDocumentField(BaseMongoLogUserInfo)
    dc = mongoengine.DateTimeField(verbose_name=u'Время запроса')
    url = mongoengine.StringField(max_length=255, verbose_name=u'Урл, к которому стучится юзер')

    def save(self, *args, **kwargs):
        self.dc = datetime.datetime.now()
        return super(RequestLog, self).save(*args, **kwargs)