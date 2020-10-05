"""poe URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.i18n import i18n_patterns
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = i18n_patterns(
    path('admin/', admin.site.urls),
    path('dashboard/', include("modules.dashboard.urls")),
    path('screen/', include("modules.screening.urls")),
    path('common/', include("modules.common.urls")),
    path('accounts/', include("django.contrib.auth.urls")),
    path('sec_screen/', include("modules.secondary_screening.urls")),
    path('reports/', include("modules.reports.urls")),
    path('', include("modules.travellers.urls")),
    prefix_default_language=False
)

urlpatterns += staticfiles_urlpatterns()

admin.site.site_header = 'POE Surveillance'
admin.site.site_title = 'POE Surveillance'
admin.site.index_title = 'Welcome to POE Admin Panel'

