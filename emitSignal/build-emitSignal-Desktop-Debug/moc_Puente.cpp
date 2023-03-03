/****************************************************************************
** Meta object code from reading C++ file 'Puente.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.4.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../emitSignal/Puente.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Puente.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.4.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_Puente_t {
    QByteArrayData data[8];
    char stringdata[70];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Puente_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Puente_t qt_meta_stringdata_Puente = {
    {
QT_MOC_LITERAL(0, 0, 6), // "Puente"
QT_MOC_LITERAL(1, 7, 13), // "senalConectaC"
QT_MOC_LITERAL(2, 21, 0), // ""
QT_MOC_LITERAL(3, 22, 3), // "txt"
QT_MOC_LITERAL(4, 26, 13), // "senalTextoDeC"
QT_MOC_LITERAL(5, 40, 7), // "conecta"
QT_MOC_LITERAL(6, 48, 10), // "leerTexto1"
QT_MOC_LITERAL(7, 59, 10) // "leerTexto2"

    },
    "Puente\0senalConectaC\0\0txt\0senalTextoDeC\0"
    "conecta\0leerTexto1\0leerTexto2"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Puente[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   39,    2, 0x06 /* Public */,
       4,    1,   42,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       5,    0,   45,    2, 0x0a /* Public */,
       6,    0,   46,    2, 0x0a /* Public */,
       7,    0,   47,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::QString,    3,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void Puente::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Puente *_t = static_cast<Puente *>(_o);
        switch (_id) {
        case 0: _t->senalConectaC((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 1: _t->senalTextoDeC((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: _t->conecta(); break;
        case 3: _t->leerTexto1(); break;
        case 4: _t->leerTexto2(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (Puente::*_t)(QString );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&Puente::senalConectaC)) {
                *result = 0;
            }
        }
        {
            typedef void (Puente::*_t)(QString );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&Puente::senalTextoDeC)) {
                *result = 1;
            }
        }
    }
}

const QMetaObject Puente::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Puente.data,
      qt_meta_data_Puente,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *Puente::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Puente::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_Puente.stringdata))
        return static_cast<void*>(const_cast< Puente*>(this));
    return QObject::qt_metacast(_clname);
}

int Puente::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}

// SIGNAL 0
void Puente::senalConectaC(QString _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void Puente::senalTextoDeC(QString _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_END_MOC_NAMESPACE
