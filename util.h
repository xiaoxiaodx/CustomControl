#ifndef UTIL_H
#define UTIL_H


//#define QML_PROPERTY(type, name, READ, getter, WRITE, setter, NOTIFY, notifyer)  type m_##name; \
//    Q_PROPERTY(type name READ getter WRITE setter NOTIFY notifyer) \
//    public: type getter() const { return m_##name;} \
//    public Q_SLOTS: void setter(type arg) { m_##name = arg; emit notifyer(arg);} \
//    Q_SIGNALS:  \
//    void notifyer(type arg);\
//    private:


//#define QML_PROPERTY(type,name,group) \
//    Q_PROPERTY(type name READ name WRITE set##name NOTIFY name##Change); \
//    public: type name() const { msetting->beginGroup(group);type value=msetting->value(#name);msetting->endGroup();return value;} \
//    public Q_SLOTS: void set##name(type arg) { msetting->beginGroup(group);msetting->setValue(#name,arg);msetting->endGroup();emit name##Change(arg);} \
//    Q_SIGNALS:  \
//    void name##Change(type arg);\
//    private:
#define QML_PROPERTY(type,name) \
    Q_PROPERTY(type name READ name WRITE set##name NOTIFY name##Change); type m_##name; \
    public: type name() const { return m_##name;} \
    public Q_SLOTS: void set##name(type arg) { m_##name = arg;emit name##Change(arg);} \
    Q_SIGNALS:  \
    void name##Change(type arg);\
    private:


#endif // UTIL_H
