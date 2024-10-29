from django.shortcuts import render

# Create your views here.
from .models import Employee
from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.db import connection

def testmysql(request):
#    cursor = connection.cursor()
#    cursor.execute('''select ssn, dname from employee, department where dno = dnumber and ssn = "333445555"''')
#    employee = cursor.fetchone()
#    context = {
#     'user_ssn': employee[0],
#     'user_name': employee[1],
#    }

#    return render(request, 'home.html', context)
         employee = Employee.objects.raw('SELECT ssn, lname FROM employee')
         context = {
             'user_ssn': employee[0].ssn,
             'user_name': employee[0].lname,
         }
         return render(request, 'home.html', context)

def testmysql1(request):
    ''' Using Raw SQL bypassing Model '''
    cursor = connection.cursor()
    cursor.execute('''select ssn, dname from employee, department where dno = dnumber''')
    rows = cursor.fetchall()
    context = {
      "data" : rows
    }

    return render(request, 'home1.html', context)

class EmployeeList(ListView):
    template_name='[YOUR_APP_NAME]/employee_list.html'
    model = Employee

class EmployeeDetail(DetailView):
    model = Employee

class EmployeeCreate(CreateView):
    model = Employee
    fields = [
        'fname',
        'minit',
        'lname',
        'ssn',
        'bdate',
        'address',
        'sex',
        'salary',
        'super_ssn',
        'dno',
    ]
    #template_name_suffix = '_update_form'
    success_url = "/list"

class EmployeeUpdate(UpdateView):
    model = Employee
    fields = [
        'fname',
        'minit',
        'lname',
        'ssn',
        'bdate',
        'address',
        'sex',
        'salary',
        'super_ssn',
        'dno',
    ]
    #template_name_suffix = '_update_form'
    success_url = "/list"

class EmployeeDelete(DeleteView):
    model = Employee
    success_url = "/list"
