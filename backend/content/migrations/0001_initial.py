# Generated by Django 4.0.3 on 2022-03-09 03:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('leactures', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Content',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('index', models.IntegerField()),
                ('text', models.CharField(max_length=50)),
                ('video_url', models.URLField()),
                ('lecture', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='leactures.lecture')),
            ],
        ),
    ]
