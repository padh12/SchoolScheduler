

Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class hris
    Public Class Employee
        Public UserId As String
        Public UserName As String
        Public FirstName As String
        Public LastName As String
        Public Role As String
        Public isAdmin As Boolean
    End Class

    Private _userid As System.String

    Public Property Userid() As System.String
        Get
            Return _userid
        End Get
        Set(ByVal value As System.String)
            _userid = value
        End Set
    End Property

    Private _usertName As System.String

    Public Property UserName() As System.String
        Get
            Return _usertName
        End Get
        Set(ByVal value As System.String)
            _usertName = value
        End Set
    End Property

    Private _firstName As System.String

    Public Property FirstName() As System.String
        Get
            Return _firstName
        End Get
        Set(ByVal value As System.String)
            _firstName = value
        End Set
    End Property

    Private _lastName As System.String

    Public Property LastName() As System.String
        Get
            Return _lastName
        End Get
        Set(ByVal value As System.String)
            _lastName = value
        End Set
    End Property

    Private _Role As System.String
    Public Property Role() As System.Boolean
        Get
            Return _Role
        End Get
        Set(ByVal value As System.Boolean)
            _Role = value
        End Set
    End Property

    Private _isAdmin As System.Boolean
    Public Property isAdmin() As System.Boolean
        Get
            Return _isAdmin
        End Get
        Set(ByVal value As System.Boolean)
            _isAdmin = value
        End Set
    End Property
    
End Class
