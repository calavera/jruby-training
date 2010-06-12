!SLIDE bullets incremental

# ¡The JVM!

* Process virtual machine to host a single application
* Accepts an intermediate language refered as bytecode
* Can be used to implement languages other than Java
* Implements a fictitious instruction set statically typed

!SLIDE java

# Invokestatic

    @@@ java
    System.exit(1);

    invokestatic java/lang/System/exit(I)V

!SLIDE java

# Invokespecial

    @@@java
    new StringBuffer();

    invokespecial java/lang/StringBuffer/<init>()V

!SLIDE java

# Invokevirtual

    @@@java
    "foo".equals("bar");

    invokevirtual
    java/lang/String/equals:(Ljava/lang/String;)Z

!SLIDE java

# Invokeinterface

    @@@java
    void foo(Collection coll) {
        boolean empty = coll.isEmpty();
    }

    invokeinterface
    java/util/Collection/isEmpty()Z 1

!SLIDE bullets incremental

# JSR 292

* Invokedynamic
* Method handlers
* Exotic identifiers

!SLIDE java

# Invokedynamic

    @@@java
    invokedynamic Object.lessThan:(Object)boolean

    invokedynamic Integer.lessThan:(Long)boolean
