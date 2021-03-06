; RUN: llc < %s -enable-unsafe-fp-math | not grep xor
; PR3374

target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:128:128"
target triple = "i386-apple-darwin7"
	%struct.AtomList = type { %"struct.CDSListRep<IVMAtom*>"* }
	%struct.AtomTree = type { %struct.IVM*, %"struct.CDSList<CDSList<HingeNode*> >" }
	%"struct.CDS::DefaultAlloc" = type <{ i8 }>
	%"struct.CDS::SingularError" = type { %"struct.CDS::exception" }
	%"struct.CDS::auto_ptr<IVMAtom>" = type { %struct.IVMAtom* }
	%"struct.CDS::exception" = type { [300 x i8] }
	%"struct.CDSList<CDSList<HingeNode*> >" = type { %"struct.CDSListRep<CDSList<HingeNode*> >"* }
	%"struct.CDSList<CDSList<int> >" = type { %"struct.CDSListRep<CDSList<int> >"* }
	%"struct.CDSList<HingeNode*>" = type { %"struct.CDSListRep<HingeNode*>"* }
	%"struct.CDSList<InternalDynamics::HingeSpec>" = type { %"struct.CDSListRep<InternalDynamics::HingeSpec>"* }
	%"struct.CDSList<Loop>" = type { %"struct.CDSListRep<Loop>"* }
	%"struct.CDSList<Pair<int, int> >" = type { %"struct.CDSListRep<Pair<int, int> >"* }
	%"struct.CDSList<int>" = type { %"struct.CDSListRep<int>"* }
	%"struct.CDSListRep<CDSList<HingeNode*> >" = type opaque
	%"struct.CDSListRep<CDSList<int> >" = type opaque
	%"struct.CDSListRep<HingeNode*>" = type { i32, i32, %struct.HingeNode**, i32 }
	%"struct.CDSListRep<IVMAtom*>" = type { i32, i32, %struct.IVMAtom**, i32 }
	%"struct.CDSListRep<InternalDynamics::HingeSpec>" = type opaque
	%"struct.CDSListRep<Loop>" = type opaque
	%"struct.CDSListRep<Pair<int, int> >" = type opaque
	%"struct.CDSListRep<int>" = type { i32, i32, i32*, i32 }
	%"struct.CDSMatrixBase<double>" = type { %"struct.CDSMatrixRep<double>"* }
	%"struct.CDSMatrixRep<double>" = type opaque
	%"struct.CDSStringRep<char>" = type { i8*, i32, i32, i32, i32 }
	%"struct.CDSVector<Vec3,0,CDS::DefaultAlloc>" = type { %"struct.CDSVectorBase<Vec3,CDS::DefaultAlloc>" }
	%"struct.CDSVector<double,0,CDS::DefaultAlloc>" = type { %"struct.CDSVectorBase<double,CDS::DefaultAlloc>" }
	%"struct.CDSVectorBase<Vec3,CDS::DefaultAlloc>" = type { %"struct.CDSVectorRep<Vec3,CDS::DefaultAlloc>"* }
	%"struct.CDSVectorBase<double,CDS::DefaultAlloc>" = type { %"struct.CDSVectorRep<double,CDS::DefaultAlloc>"* }
	%"struct.CDSVectorRep<Vec3,CDS::DefaultAlloc>" = type { i32, %"struct.CDS::DefaultAlloc", %struct.Vec3*, i32 }
	%"struct.CDSVectorRep<double,CDS::DefaultAlloc>" = type { i32, %"struct.CDS::DefaultAlloc", double*, i32 }
	%"struct.FixedMatrix<double,1,1,0,0>" = type { %"struct.FixedMatrixBase<double,1,1>" }
	%"struct.FixedMatrix<double,1,3,0,0>" = type { %"struct.FixedMatrixBase<double,1,3>" }
	%"struct.FixedMatrix<double,1,6,0,0>" = type { %"struct.FixedMatrixBase<double,1,6>" }
	%"struct.FixedMatrix<double,2,2,0,0>" = type { %"struct.FixedMatrixBase<double,2,2>" }
	%"struct.FixedMatrix<double,2,6,0,0>" = type { %"struct.FixedMatrixBase<double,2,6>" }
	%"struct.FixedMatrix<double,3,3,0,0>" = type { %"struct.FixedMatrixBase<double,3,3>" }
	%"struct.FixedMatrix<double,3,6,0,0>" = type { %"struct.FixedMatrixBase<double,3,6>" }
	%"struct.FixedMatrix<double,5,5,0,0>" = type { %"struct.FixedMatrixBase<double,5,5>" }
	%"struct.FixedMatrix<double,5,6,0,0>" = type { %"struct.FixedMatrixBase<double,5,6>" }
	%"struct.FixedMatrixBase<double,1,1>" = type { [1 x double] }
	%"struct.FixedMatrixBase<double,1,3>" = type { [3 x double] }
	%"struct.FixedMatrixBase<double,1,6>" = type { [6 x double] }
	%"struct.FixedMatrixBase<double,2,2>" = type { [4 x double] }
	%"struct.FixedMatrixBase<double,2,6>" = type { [12 x double] }
	%"struct.FixedMatrixBase<double,3,3>" = type { [9 x double] }
	%"struct.FixedMatrixBase<double,3,6>" = type { [18 x double] }
	%"struct.FixedMatrixBase<double,5,5>" = type { [25 x double] }
	%"struct.FixedMatrixBase<double,5,6>" = type { [30 x double] }
	%"struct.FixedMatrixBase<double,6,6>" = type { [36 x double] }
	%"struct.FixedVector<double,2,0>" = type { %"struct.FixedVectorBase<double,2>" }
	%"struct.FixedVector<double,5,0>" = type { %"struct.FixedVectorBase<double,5>" }
	%"struct.FixedVectorBase<double,2>" = type { [2 x double] }
	%"struct.FixedVectorBase<double,5>" = type { [5 x double] }
	%struct.HNodeOrigin = type { %struct.HingeNode }
	%struct.HNodeRotate2 = type { %"struct.HingeNodeSpec<2>", %struct.Vec3, %struct.Vec3, %struct.Vec3, %struct.Vec3, %struct.Vec3, %struct.Mat3, %struct.Mat3, %struct.Vec3, %"struct.CDS::auto_ptr<IVMAtom>", %"struct.CDSVector<Vec3,0,CDS::DefaultAlloc>" }
	%struct.HNodeRotate3 = type { %"struct.HingeNodeSpec<3>", %struct.Vec4, %struct.Vec4, %struct.Vec4, %struct.Vec3, %"struct.CDS::auto_ptr<IVMAtom>", %"struct.CDSVector<Vec3,0,CDS::DefaultAlloc>", double, double, double, double, double, double, i8 }
	%struct.HNodeTorsion = type { %"struct.HingeNodeSpec<1>", %struct.Vec3, %"struct.CDSVector<Vec3,0,CDS::DefaultAlloc>", %struct.Vec3, %struct.Mat3 }
	%struct.HNodeTranslate = type { %"struct.HingeNodeSpec<3>", %struct.IVMAtom*, %struct.Vec3, %"struct.CDSVector<Vec3,0,CDS::DefaultAlloc>" }
	%struct.HNodeTranslateRotate2 = type { %"struct.HingeNodeSpec<5>", %struct.Vec3, %struct.Vec3, %struct.Vec3, %struct.Vec3, %struct.Vec3, %struct.Mat3, %struct.Mat3, %struct.Vec3, %"struct.CDS::auto_ptr<IVMAtom>", %"struct.CDSVector<Vec3,0,CDS::DefaultAlloc>" }
	%struct.HNodeTranslateRotate3 = type { %"struct.HingeNodeSpec<6>", %struct.Vec4, %struct.Vec4, %struct.Vec4, %struct.Vec3, %"struct.CDS::auto_ptr<IVMAtom>", %"struct.CDSVector<Vec3,0,CDS::DefaultAlloc>", double, double, double, double, double, double, i8 }
	%struct.HingeNode = type { i32 (...)**, %struct.HingeNode*, %"struct.CDSList<HingeNode*>", i32, %struct.AtomList, %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %struct.PhiMatrix, %struct.Mat6, %struct.Mat6, %"struct.FixedMatrix<double,1,6,0,0>", %struct.Mat6, %"struct.FixedMatrix<double,1,6,0,0>", %struct.Mat3, %struct.Mat6, %struct.IVM*, %struct.IVMAtom* }
	%"struct.HingeNodeSpec<1>" = type { %struct.HingeNode, i32, double, %struct.InertiaTensor, %struct.Mat6, %struct.Vec3, %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,1,0,0>", %"struct.FixedMatrix<double,1,1,0,0>", %"struct.FixedMatrix<double,1,1,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,1,0,0>", %"struct.FixedMatrix<double,1,1,0,0>", %"struct.FixedMatrix<double,1,1,0,0>", %"struct.FixedMatrix<double,1,1,0,0>", %"struct.FixedMatrix<double,1,6,0,0>" }
	%"struct.HingeNodeSpec<2>" = type { %struct.HingeNode, i32, double, %struct.InertiaTensor, %struct.Mat6, %struct.Vec3, %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedVector<double,2,0>", %"struct.FixedVector<double,2,0>", %"struct.FixedVector<double,2,0>", %"struct.FixedMatrix<double,2,6,0,0>", %"struct.FixedVector<double,2,0>", %"struct.FixedVector<double,2,0>", %"struct.FixedVector<double,2,0>", %"struct.FixedMatrix<double,2,2,0,0>", %"struct.FixedMatrix<double,2,6,0,0>" }
	%"struct.HingeNodeSpec<3>" = type { %struct.HingeNode, i32, double, %struct.InertiaTensor, %struct.Mat6, %struct.Vec3, %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,3,0,0>", %"struct.FixedMatrix<double,1,3,0,0>", %"struct.FixedMatrix<double,1,3,0,0>", %"struct.FixedMatrix<double,3,6,0,0>", %"struct.FixedMatrix<double,1,3,0,0>", %"struct.FixedMatrix<double,1,3,0,0>", %"struct.FixedMatrix<double,1,3,0,0>", %"struct.FixedMatrix<double,3,3,0,0>", %"struct.FixedMatrix<double,3,6,0,0>" }
	%"struct.HingeNodeSpec<5>" = type { %struct.HingeNode, i32, double, %struct.InertiaTensor, %struct.Mat6, %struct.Vec3, %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedVector<double,5,0>", %"struct.FixedVector<double,5,0>", %"struct.FixedVector<double,5,0>", %"struct.FixedMatrix<double,5,6,0,0>", %"struct.FixedVector<double,5,0>", %"struct.FixedVector<double,5,0>", %"struct.FixedVector<double,5,0>", %"struct.FixedMatrix<double,5,5,0,0>", %"struct.FixedMatrix<double,5,6,0,0>" }
	%"struct.HingeNodeSpec<6>" = type { %struct.HingeNode, i32, double, %struct.InertiaTensor, %struct.Mat6, %struct.Vec3, %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %struct.Mat6, %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %"struct.FixedMatrix<double,1,6,0,0>", %struct.Mat6, %struct.Mat6 }
	%struct.IVM = type { i32 (...)**, %struct.AtomTree*, %struct.Integrator*, %struct.LengthConstraints*, i32, i32, i32, i8, i8, i8, i8, double, double, double, double, double, double, double, double, double, i32, double, double, double, double, double, double, %"struct.CDSList<Loop>", %"struct.CDSList<Pair<int, int> >", %struct.AtomList, %"struct.CDSList<CDSList<int> >", %"struct.CDSList<InternalDynamics::HingeSpec>", %struct.String, %"struct.CDSList<int>", i32 (%"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)*, double (%"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)*, i32 (%"struct.CDSVector<Vec3,0,CDS::DefaultAlloc>"*)*, double (%"struct.CDSVector<Vec3,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<Vec3,0,CDS::DefaultAlloc>"*)* }
	%struct.IVMAtom = type { i32, %struct.HingeNode*, %struct.AtomList, %struct.Vec3, %struct.Vec3, %struct.Vec3, double, double }
	%struct.InertiaTensor = type { %struct.Mat3 }
	%struct.Integrator = type { i32 (...)**, %"struct.CDSVector<double,0,CDS::DefaultAlloc>", %"struct.CDSVector<double,0,CDS::DefaultAlloc>", %struct.IVM* }
	%"struct.InternalDynamics::HingeSpec" = type { %struct.String, i32, i32, %"struct.CDSList<int>" }
	%struct.LengthConstraints = type { double, i32, i32, %struct.IVM*, %struct.LengthConstraintsPrivates* }
	%struct.LengthConstraintsPrivates = type opaque
	%struct.Mat3 = type { %"struct.FixedMatrix<double,3,3,0,0>" }
	%struct.Mat6 = type { %"struct.FixedMatrixBase<double,6,6>" }
	%"struct.MatrixTools::InverseResults<FullMatrix<double> >" = type { %"struct.CDSVector<double,0,CDS::DefaultAlloc>", i32 }
	%struct.PhiMatrix = type { %struct.Vec3 }
	%struct.PhiMatrixTranspose = type { %struct.PhiMatrix* }
	%struct.RMat = type { %"struct.CDSMatrixBase<double>" }
	%struct.String = type { %"struct.CDSStringRep<char>"* }
	%"struct.SubMatrix<FixedMatrix<double, 6, 6, 0, 0> >" = type { %struct.Mat6*, i32, i32, i32, i32 }
	%"struct.SubVector<CDSVector<double, 1, CDS::DefaultAlloc> >" = type { %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, i32, i32 }
	%"struct.SubVector<FixedVector<double, 6, 0> >" = type { %"struct.FixedMatrix<double,1,6,0,0>"*, i32, i32 }
	%struct.Vec3 = type { %"struct.FixedMatrix<double,1,3,0,0>" }
	%struct.Vec4 = type { %"struct.FixedMatrix<double,2,2,0,0>" }
	%struct.__class_type_info_pseudo = type { %struct.__type_info_pseudo }
	%struct.__si_class_type_info_pseudo = type { %struct.__type_info_pseudo, %"struct.std::type_info"* }
	%struct.__type_info_pseudo = type { i8*, i8* }
	%"struct.std::basic_ios<char,std::char_traits<char> >" = type { %"struct.std::ios_base", %"struct.std::basic_ostream<char,std::char_traits<char> >"*, i8, i8, %"struct.std::basic_streambuf<char,std::char_traits<char> >"*, %"struct.std::ctype<char>"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"*, %"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >"* }
	%"struct.std::basic_ostream<char,std::char_traits<char> >" = type { i32 (...)**, %"struct.std::basic_ios<char,std::char_traits<char> >" }
	%"struct.std::basic_streambuf<char,std::char_traits<char> >" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"struct.std::locale" }
	%"struct.std::ctype<char>" = type { %"struct.std::locale::facet", i32*, i8, i32*, i32*, i32*, i8, [256 x i8], [256 x i8], i8 }
	%"struct.std::ios_base" = type { i32 (...)**, i32, i32, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"struct.std::locale" }
	%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"struct.std::ios_base"*, i32)*, i32, i32 }
	%"struct.std::ios_base::_Words" = type { i8*, i32 }
	%"struct.std::locale" = type { %"struct.std::locale::_Impl"* }
	%"struct.std::locale::_Impl" = type { i32, %"struct.std::locale::facet"**, i32, %"struct.std::locale::facet"**, i8** }
	%"struct.std::locale::facet" = type { i32 (...)**, i32 }
	%"struct.std::num_get<char,std::istreambuf_iterator<char, std::char_traits<char> > >" = type { %"struct.std::locale::facet" }
	%"struct.std::type_info" = type { i32 (...)**, i8* }
@_ZN9HingeNode7DEG2RADE = external constant double, align 8		; <double*> [#uses=0]
@"\01LC" = external constant [8 x i8]		; <[8 x i8]*> [#uses=0]
@"\01LC1" = external constant [7 x i8]		; <[7 x i8]*> [#uses=0]
@"\01LC2" = external constant [10 x i8]		; <[10 x i8]*> [#uses=0]
@"\01LC3" = external constant [5 x i8]		; <[5 x i8]*> [#uses=0]
@"\01LC4" = external constant [8 x i8]		; <[8 x i8]*> [#uses=0]
@"\01LC5" = external constant [8 x i8]		; <[8 x i8]*> [#uses=0]
@"\01LC6" = external constant [7 x i8]		; <[7 x i8]*> [#uses=0]
@"\01LC7" = external constant [8 x i8]		; <[8 x i8]*> [#uses=0]
@"\01LC8" = external constant [3 x i8]		; <[3 x i8]*> [#uses=0]
@"\01LC9" = external constant [3 x i8]		; <[3 x i8]*> [#uses=0]
@"\01LC10" = external constant [3 x i8]		; <[3 x i8]*> [#uses=0]
@_ZStL8__ioinit = external global %"struct.CDS::DefaultAlloc"		; <%"struct.CDS::DefaultAlloc"*> [#uses=0]
@__dso_handle = external global i8*		; <i8**> [#uses=0]
@_ZTIN9HingeNode17VirtualBaseMethodE = external constant %struct.__class_type_info_pseudo		; <%struct.__class_type_info_pseudo*> [#uses=0]
@_ZTVN10__cxxabiv117__class_type_infoE = external constant [0 x i32 (...)*]		; <[0 x i32 (...)*]*> [#uses=0]
@_ZTSN9HingeNode17VirtualBaseMethodE = external constant [32 x i8], align 4		; <[32 x i8]*> [#uses=0]
@_ZTV9HingeNode = external constant [31 x i32 (...)*], align 32		; <[31 x i32 (...)*]*> [#uses=0]
@_ZTI9HingeNode = external constant %struct.__class_type_info_pseudo		; <%struct.__class_type_info_pseudo*> [#uses=0]
@_ZTS9HingeNode = external constant [11 x i8]		; <[11 x i8]*> [#uses=0]
@_ZTV11HNodeOrigin = external constant [31 x i32 (...)*], align 32		; <[31 x i32 (...)*]*> [#uses=0]
@_ZTI11HNodeOrigin = external constant %struct.__si_class_type_info_pseudo		; <%struct.__si_class_type_info_pseudo*> [#uses=0]
@_ZTVN10__cxxabiv120__si_class_type_infoE = external constant [0 x i32 (...)*]		; <[0 x i32 (...)*]*> [#uses=0]
@_ZTS11HNodeOrigin = external constant [14 x i8]		; <[14 x i8]*> [#uses=0]
@_ZTV13HingeNodeSpecILi1EE = external constant [33 x i32 (...)*], align 32		; <[33 x i32 (...)*]*> [#uses=0]
@_ZTI13HingeNodeSpecILi1EE = external constant %struct.__si_class_type_info_pseudo		; <%struct.__si_class_type_info_pseudo*> [#uses=0]
@_ZTS13HingeNodeSpecILi1EE = external constant [22 x i8]		; <[22 x i8]*> [#uses=0]
@_ZTV13HingeNodeSpecILi3EE = external constant [33 x i32 (...)*], align 32		; <[33 x i32 (...)*]*> [#uses=0]
@_ZTI13HingeNodeSpecILi3EE = external constant %struct.__si_class_type_info_pseudo		; <%struct.__si_class_type_info_pseudo*> [#uses=0]
@_ZTS13HingeNodeSpecILi3EE = external constant [22 x i8]		; <[22 x i8]*> [#uses=0]
@_ZTV13HingeNodeSpecILi2EE = external constant [33 x i32 (...)*], align 32		; <[33 x i32 (...)*]*> [#uses=0]
@_ZTI13HingeNodeSpecILi2EE = external constant %struct.__si_class_type_info_pseudo		; <%struct.__si_class_type_info_pseudo*> [#uses=0]
@_ZTS13HingeNodeSpecILi2EE = external constant [22 x i8]		; <[22 x i8]*> [#uses=0]
@_ZTV13HingeNodeSpecILi6EE = external constant [33 x i32 (...)*], align 32		; <[33 x i32 (...)*]*> [#uses=0]
@_ZTI13HingeNodeSpecILi6EE = external constant %struct.__si_class_type_info_pseudo		; <%struct.__si_class_type_info_pseudo*> [#uses=0]
@_ZTS13HingeNodeSpecILi6EE = external constant [22 x i8]		; <[22 x i8]*> [#uses=0]
@_ZTV13HingeNodeSpecILi5EE = external constant [33 x i32 (...)*], align 32		; <[33 x i32 (...)*]*> [#uses=0]
@_ZTI13HingeNodeSpecILi5EE = external constant %struct.__si_class_type_info_pseudo		; <%struct.__si_class_type_info_pseudo*> [#uses=0]
@_ZTS13HingeNodeSpecILi5EE = external constant [22 x i8]		; <[22 x i8]*> [#uses=0]
@_ZSt4cout = external global %"struct.std::basic_ostream<char,std::char_traits<char> >"		; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=0]
@"\01LC11" = external constant [10 x i8]		; <[10 x i8]*> [#uses=0]
@"\01LC12" = external constant [8 x i8]		; <[8 x i8]*> [#uses=0]
@"\01LC13" = external constant [10 x i8]		; <[10 x i8]*> [#uses=0]
@_ZSt4cerr = external global %"struct.std::basic_ostream<char,std::char_traits<char> >"		; <%"struct.std::basic_ostream<char,std::char_traits<char> >"*> [#uses=0]
@"\01LC14" = external constant [29 x i8]		; <[29 x i8]*> [#uses=0]
@"\01LC15" = external constant [11 x i8]		; <[11 x i8]*> [#uses=0]
@"\01LC16" = external constant [13 x i8]		; <[13 x i8]*> [#uses=0]
@"\01LC17" = external constant [21 x i8]		; <[21 x i8]*> [#uses=0]
@"\01LC18" = external constant [8 x i8]		; <[8 x i8]*> [#uses=0]
@"\01LC19" = external constant [4 x i8]		; <[4 x i8]*> [#uses=0]
@"\01LC20" = external constant [42 x i8]		; <[42 x i8]*> [#uses=0]
@_ZTIN16InternalDynamics9ExceptionE = external constant %struct.__class_type_info_pseudo		; <%struct.__class_type_info_pseudo*> [#uses=0]
@_ZTSN16InternalDynamics9ExceptionE = external constant [31 x i8], align 4		; <[31 x i8]*> [#uses=0]
@_ZTIN3CDS13SingularErrorE = external constant %struct.__si_class_type_info_pseudo		; <%struct.__si_class_type_info_pseudo*> [#uses=0]
@_ZTSN3CDS13SingularErrorE = external constant [22 x i8]		; <[22 x i8]*> [#uses=0]
@_ZTIN3CDS9exceptionE = external constant %struct.__class_type_info_pseudo		; <%struct.__class_type_info_pseudo*> [#uses=0]
@_ZTSN3CDS9exceptionE = external constant [17 x i8]		; <[17 x i8]*> [#uses=0]
@_ZTV12HNodeTorsion = external constant [33 x i32 (...)*], align 32		; <[33 x i32 (...)*]*> [#uses=0]
@_ZTI12HNodeTorsion = external constant %struct.__si_class_type_info_pseudo		; <%struct.__si_class_type_info_pseudo*> [#uses=0]
@_ZTS12HNodeTorsion = external constant [15 x i8]		; <[15 x i8]*> [#uses=0]
@_ZTV12HNodeRotate3 = external constant [33 x i32 (...)*], align 32		; <[33 x i32 (...)*]*> [#uses=0]
@_ZTI12HNodeRotate3 = external constant %struct.__si_class_type_info_pseudo		; <%struct.__si_class_type_info_pseudo*> [#uses=0]
@_ZTS12HNodeRotate3 = external constant [15 x i8]		; <[15 x i8]*> [#uses=0]
@_ZTV12HNodeRotate2 = external constant [33 x i32 (...)*], align 32		; <[33 x i32 (...)*]*> [#uses=0]
@_ZTI12HNodeRotate2 = external constant %struct.__si_class_type_info_pseudo		; <%struct.__si_class_type_info_pseudo*> [#uses=0]
@_ZTS12HNodeRotate2 = external constant [15 x i8]		; <[15 x i8]*> [#uses=0]
@_ZTV21HNodeTranslateRotate3 = external constant [33 x i32 (...)*], align 32		; <[33 x i32 (...)*]*> [#uses=0]
@_ZTI21HNodeTranslateRotate3 = external constant %struct.__si_class_type_info_pseudo		; <%struct.__si_class_type_info_pseudo*> [#uses=0]
@_ZTS21HNodeTranslateRotate3 = external constant [24 x i8]		; <[24 x i8]*> [#uses=0]
@_ZTV21HNodeTranslateRotate2 = external constant [33 x i32 (...)*], align 32		; <[33 x i32 (...)*]*> [#uses=0]
@_ZTI21HNodeTranslateRotate2 = external constant %struct.__si_class_type_info_pseudo		; <%struct.__si_class_type_info_pseudo*> [#uses=0]
@_ZTS21HNodeTranslateRotate2 = external constant [24 x i8]		; <[24 x i8]*> [#uses=0]
@_ZTV14HNodeTranslate = external constant [33 x i32 (...)*], align 32		; <[33 x i32 (...)*]*> [#uses=0]
@_ZTI14HNodeTranslate = external constant %struct.__si_class_type_info_pseudo		; <%struct.__si_class_type_info_pseudo*> [#uses=0]
@_ZTS14HNodeTranslate = external constant [17 x i8]		; <[17 x i8]*> [#uses=0]
@"\01LC21" = external constant [31 x i8]		; <[31 x i8]*> [#uses=0]
@"\01LC22" = external constant [6 x i8]		; <[6 x i8]*> [#uses=0]
@"\01LC23" = external constant [12 x i8]		; <[12 x i8]*> [#uses=0]
@"\01LC24" = external constant [5 x i8]		; <[5 x i8]*> [#uses=0]
@"\01LC25" = external constant [7 x i8]		; <[7 x i8]*> [#uses=0]
@"\01LC26" = external constant [7 x i8]		; <[7 x i8]*> [#uses=0]
@"\01LC27" = external constant [43 x i8]		; <[43 x i8]*> [#uses=0]
@"\01LC28" = external constant [15 x i8]		; <[15 x i8]*> [#uses=0]
@"\01LC29" = external constant [20 x i8]		; <[20 x i8]*> [#uses=0]
@"\01LC30" = external constant [41 x i8]		; <[41 x i8]*> [#uses=0]

declare void @_GLOBAL__I__ZN9HingeNode7DEG2RADE() section "__TEXT,__StaticInit,regular,pure_instructions"

declare void @_ZN9HingeNode16velFromCartesianEv(%struct.HingeNode*) nounwind

declare i32 @_ZNK9HingeNode6offsetEv(%struct.HingeNode*) nounwind

declare i32 @_ZNK9HingeNode6getDOFEv(%struct.HingeNode*) nounwind

declare i32 @_ZNK9HingeNode6getDimEv(%struct.HingeNode*) nounwind

declare double @_ZN9HingeNode8kineticEEv(%struct.HingeNode*) nounwind

declare double @_ZN9HingeNode8approxKEEv(%struct.HingeNode*) nounwind

declare i8* @_ZN9HingeNode4typeEv(%struct.HingeNode*) nounwind

declare i8* @_ZN11HNodeOrigin4typeEv(%struct.HNodeOrigin*) nounwind

declare void @_ZN11HNodeOrigin5calcPEv(%struct.HNodeOrigin*) nounwind

declare void @_ZN11HNodeOrigin5calcZEv(%struct.HNodeOrigin*) nounwind

declare void @_ZN11HNodeOrigin9calcPandZEv(%struct.HNodeOrigin*) nounwind

declare void @_ZN11HNodeOrigin9calcAccelEv(%struct.HNodeOrigin*) nounwind

declare void @_ZN11HNodeOrigin17calcInternalForceEv(%struct.HNodeOrigin*) nounwind

declare void @_ZN11HNodeOrigin18prepareVelInternalEv(%struct.HNodeOrigin*) nounwind

declare void @_ZN11HNodeOrigin13propagateSVelERK11FixedVectorIdLi6ELi0EE(%struct.HNodeOrigin*, %"struct.FixedMatrix<double,1,6,0,0>"*) nounwind

declare void @_ZN11HNodeOrigin9setPosVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEES5_(%struct.HNodeOrigin*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*) nounwind

declare void @_ZN11HNodeOrigin6setVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeOrigin*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*) nounwind

declare void @_ZN11HNodeOrigin14setVelFromSVelERK11FixedVectorIdLi6ELi0EE(%struct.HNodeOrigin*, %"struct.FixedMatrix<double,1,6,0,0>"*) nounwind

declare void @_ZN11HNodeOrigin18enforceConstraintsER9CDSVectorIdLi1EN3CDS12DefaultAllocEES4_(%struct.HNodeOrigin*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*) nounwind

declare void @_ZN11HNodeOrigin5printEi(%struct.HNodeOrigin*, i32) nounwind

declare void @_ZN11HNodeOrigin6getPosER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeOrigin*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*) nounwind

declare void @_ZN11HNodeOrigin6getVelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeOrigin*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*) nounwind

declare void @_ZN11HNodeOrigin8getAccelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeOrigin*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*) nounwind

declare void @_ZN11HNodeOrigin16getInternalForceER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeOrigin*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*) nounwind

declare void @_ZN11HNodeOrigin5calcYEv(%struct.HNodeOrigin*) nounwind

declare i8* @_ZN14HNodeTranslate4typeEv(%struct.HNodeTranslate*) nounwind

declare i8* @_ZN21HNodeTranslateRotate34typeEv(%struct.HNodeTranslateRotate3*) nounwind

declare i32 @_ZNK21HNodeTranslateRotate36getDimEv(%struct.HNodeTranslateRotate3*) nounwind

declare i8* @_ZN12HNodeRotate34typeEv(%struct.HNodeRotate3*) nounwind

declare i32 @_ZNK12HNodeRotate36getDimEv(%struct.HNodeRotate3*) nounwind

declare i8* @_ZN12HNodeRotate24typeEv(%struct.HNodeRotate2*) nounwind

declare i32 @_ZNK12HNodeRotate26getDimEv(%struct.HNodeRotate2*) nounwind

declare i8* @_ZN21HNodeTranslateRotate24typeEv(%struct.HNodeTranslateRotate2*) nounwind

declare i32 @_ZNK21HNodeTranslateRotate26getDimEv(%struct.HNodeTranslateRotate2*) nounwind

declare i8* @_ZN12HNodeTorsion4typeEv(%struct.HNodeTorsion*) nounwind

declare fastcc double @_ZL12sumMassToTipPK9HingeNode(%struct.HingeNode*)

declare void @_ZN13InertiaTensor4calcERK4Vec3RK7CDSListIP7IVMAtomE(%struct.InertiaTensor*, %struct.Vec3*, %struct.AtomList*) nounwind

declare fastcc double @_ZL15sumInertiaToTipPK9HingeNodeRK4Vec3S4_(%struct.HingeNode*, %struct.Vec3*, %struct.Vec3*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsI11FixedVectorIdLi6ELi0EEERSoS2_RK9SubVectorIT_E(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.SubVector<FixedVector<double, 6, 0> >"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St5_Setw(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, i32)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, i8*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZNSolsEd(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, double)

declare void @_Z14orthoTransformIdLi3ELi3EE11FixedMatrixIT_XT1_EXT1_ELi0ELi0EERKS0_IS1_XT0_EXT0_ELi0ELi0EERKS0_IS1_XT1_EXT0_ELi0ELi0EE(%"struct.FixedMatrix<double,3,3,0,0>"* noalias sret, %"struct.FixedMatrix<double,3,3,0,0>"*, %"struct.FixedMatrix<double,3,3,0,0>"*)

declare void @_ZN12HNodeRotate27calcRotEv(%struct.HNodeRotate2*)

declare void @_ZN21HNodeTranslateRotate27calcRotEv(%struct.HNodeTranslateRotate2*)

declare void @_ZmlIdLi6ELi6EE11FixedVectorIT_XT0_ELi0EERK11FixedMatrixIS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT1_ELi0EE(%"struct.FixedMatrix<double,1,6,0,0>"* noalias sret, %struct.Mat6*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZmlIdLi6ELi6ELi6EE11FixedMatrixIT_XT0_EXT2_ELi0ELi0EERKS0_IS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT1_EXT2_ELi0ELi0EE(%struct.Mat6* noalias sret, %struct.Mat6*, %struct.Mat6*)

declare void @_ZmlIdLi6ELi6ELi3EE11FixedMatrixIT_XT0_EXT2_ELi0ELi0EERKS0_IS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT1_EXT2_ELi0ELi0EE(%"struct.FixedMatrix<double,3,6,0,0>"* noalias sret, %struct.Mat6*, %"struct.FixedMatrix<double,3,6,0,0>"*)

declare void @_ZmlIdLi6ELi6ELi2EE11FixedMatrixIT_XT0_EXT2_ELi0ELi0EERKS0_IS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT1_EXT2_ELi0ELi0EE(%"struct.FixedMatrix<double,2,6,0,0>"* noalias sret, %struct.Mat6*, %"struct.FixedMatrix<double,2,6,0,0>"*)

declare void @_ZmlIdLi5ELi6EE11FixedVectorIT_XT0_ELi0EERK11FixedMatrixIS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT1_ELi0EE(%"struct.FixedVector<double,5,0>"* noalias sret, %"struct.FixedMatrix<double,5,6,0,0>"*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZmlIdLi6ELi6ELi5EE11FixedMatrixIT_XT0_EXT2_ELi0ELi0EERKS0_IS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT1_EXT2_ELi0ELi0EE(%"struct.FixedMatrix<double,5,6,0,0>"* noalias sret, %struct.Mat6*, %"struct.FixedMatrix<double,5,6,0,0>"*)

declare void @_ZN12HNodeRotate39setPosVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEES5_(%struct.HNodeRotate3*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN12HNodeRotate29setPosVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEES5_(%struct.HNodeRotate2*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN21HNodeTranslateRotate39setPosVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEES5_(%struct.HNodeTranslateRotate3*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN21HNodeTranslateRotate29setPosVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEES5_(%struct.HNodeTranslateRotate2*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare i32 @_ZNK13HingeNodeSpecILi1EE6offsetEv(%"struct.HingeNodeSpec<1>"*) nounwind

declare %struct.Vec3* @_ZNK13HingeNodeSpecILi1EE5posCMEv(%"struct.HingeNodeSpec<1>"*) nounwind

declare double* @_ZNK13HingeNodeSpecILi1EE4massEv(%"struct.HingeNodeSpec<1>"*) nounwind

declare void @_ZN13HingeNodeSpecILi1EE9calcPandZEv(%"struct.HingeNodeSpec<1>"*)

declare i32 @_ZNK13HingeNodeSpecILi1EE6getDOFEv(%"struct.HingeNodeSpec<1>"*) nounwind

declare i32 @_ZNK13HingeNodeSpecILi1EE6getDimEv(%"struct.HingeNodeSpec<1>"*) nounwind

declare void @_ZN13HingeNodeSpecILi1EE18enforceConstraintsER9CDSVectorIdLi1EN3CDS12DefaultAllocEES5_(%"struct.HingeNodeSpec<1>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*) nounwind

declare i32 @_ZNK13HingeNodeSpecILi5EE6offsetEv(%"struct.HingeNodeSpec<5>"*) nounwind

declare %struct.Vec3* @_ZNK13HingeNodeSpecILi5EE5posCMEv(%"struct.HingeNodeSpec<5>"*) nounwind

declare double* @_ZNK13HingeNodeSpecILi5EE4massEv(%"struct.HingeNodeSpec<5>"*) nounwind

declare void @_ZN13HingeNodeSpecILi5EE9calcPandZEv(%"struct.HingeNodeSpec<5>"*)

declare i32 @_ZNK13HingeNodeSpecILi5EE6getDOFEv(%"struct.HingeNodeSpec<5>"*) nounwind

declare i32 @_ZNK13HingeNodeSpecILi5EE6getDimEv(%"struct.HingeNodeSpec<5>"*) nounwind

declare void @_ZN13HingeNodeSpecILi5EE18enforceConstraintsER9CDSVectorIdLi1EN3CDS12DefaultAllocEES5_(%"struct.HingeNodeSpec<5>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*) nounwind

declare i32 @_ZNK13HingeNodeSpecILi2EE6offsetEv(%"struct.HingeNodeSpec<2>"*) nounwind

declare %struct.Vec3* @_ZNK13HingeNodeSpecILi2EE5posCMEv(%"struct.HingeNodeSpec<2>"*) nounwind

declare double* @_ZNK13HingeNodeSpecILi2EE4massEv(%"struct.HingeNodeSpec<2>"*) nounwind

declare void @_ZN13HingeNodeSpecILi2EE9calcPandZEv(%"struct.HingeNodeSpec<2>"*)

declare i32 @_ZNK13HingeNodeSpecILi2EE6getDOFEv(%"struct.HingeNodeSpec<2>"*) nounwind

declare i32 @_ZNK13HingeNodeSpecILi2EE6getDimEv(%"struct.HingeNodeSpec<2>"*) nounwind

declare void @_ZN13HingeNodeSpecILi2EE18enforceConstraintsER9CDSVectorIdLi1EN3CDS12DefaultAllocEES5_(%"struct.HingeNodeSpec<2>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*) nounwind

declare i32 @_ZNK13HingeNodeSpecILi3EE6offsetEv(%"struct.HingeNodeSpec<3>"*) nounwind

declare %struct.Vec3* @_ZNK13HingeNodeSpecILi3EE5posCMEv(%"struct.HingeNodeSpec<3>"*) nounwind

declare double* @_ZNK13HingeNodeSpecILi3EE4massEv(%"struct.HingeNodeSpec<3>"*) nounwind

declare void @_ZN13HingeNodeSpecILi3EE9calcPandZEv(%"struct.HingeNodeSpec<3>"*)

declare i32 @_ZNK13HingeNodeSpecILi3EE6getDOFEv(%"struct.HingeNodeSpec<3>"*) nounwind

declare i32 @_ZNK13HingeNodeSpecILi6EE6offsetEv(%"struct.HingeNodeSpec<6>"*) nounwind

declare %struct.Vec3* @_ZNK13HingeNodeSpecILi6EE5posCMEv(%"struct.HingeNodeSpec<6>"*) nounwind

declare double* @_ZNK13HingeNodeSpecILi6EE4massEv(%"struct.HingeNodeSpec<6>"*) nounwind

declare void @_ZN13HingeNodeSpecILi6EE9calcPandZEv(%"struct.HingeNodeSpec<6>"*)

declare i32 @_ZNK13HingeNodeSpecILi6EE6getDOFEv(%"struct.HingeNodeSpec<6>"*) nounwind

declare i32 @_ZNK13HingeNodeSpecILi6EE6getDimEv(%"struct.HingeNodeSpec<6>"*) nounwind

declare void @_ZN13HingeNodeSpecILi6EE9setPosVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEES6_(%"struct.HingeNodeSpec<6>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi6EE18enforceConstraintsER9CDSVectorIdLi1EN3CDS12DefaultAllocEES5_(%"struct.HingeNodeSpec<6>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*) nounwind

declare i32 @_ZNK13HingeNodeSpecILi3EE6getDimEv(%"struct.HingeNodeSpec<3>"*) nounwind

declare void @_ZN13HingeNodeSpecILi3EE9setPosVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEES6_(%"struct.HingeNodeSpec<3>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi3EE18enforceConstraintsER9CDSVectorIdLi1EN3CDS12DefaultAllocEES5_(%"struct.HingeNodeSpec<3>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*) nounwind

declare void @_Z14orthoTransformIdLi6ELi6EE11FixedMatrixIT_XT1_EXT1_ELi0ELi0EERKS0_IS1_XT0_EXT0_ELi0ELi0EERKS0_IS1_XT1_EXT0_ELi0ELi0EE(%struct.Mat6* noalias sret, %struct.Mat6*, %struct.Mat6*)

declare double @_ZN13HingeNodeSpecILi1EE8kineticEEv(%"struct.HingeNodeSpec<1>"*)

declare double @_ZN13HingeNodeSpecILi3EE8kineticEEv(%"struct.HingeNodeSpec<3>"*)

declare double @_ZN13HingeNodeSpecILi2EE8kineticEEv(%"struct.HingeNodeSpec<2>"*)

declare double @_ZN13HingeNodeSpecILi6EE8kineticEEv(%"struct.HingeNodeSpec<6>"*)

declare double @_ZN13HingeNodeSpecILi5EE8kineticEEv(%"struct.HingeNodeSpec<5>"*)

declare void @_ZmlIdLi6ELi5ELi6EE11FixedMatrixIT_XT0_EXT2_ELi0ELi0EERKS0_IS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT1_EXT2_ELi0ELi0EE(%struct.Mat6* noalias sret, %"struct.FixedMatrix<double,5,6,0,0>"*, %"struct.FixedMatrix<double,5,6,0,0>"*)

declare void @_ZN13HingeNodeSpecILi1EE9setPosVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEES6_(%"struct.HingeNodeSpec<1>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi5EE9setPosVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEES6_(%"struct.HingeNodeSpec<5>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi2EE9setPosVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEES6_(%"struct.HingeNodeSpec<2>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_Z14orthoTransformIdLi3ELi6EE11FixedMatrixIT_XT1_EXT1_ELi0ELi0EERKS0_IS1_XT0_EXT0_ELi0ELi0EERKS0_IS1_XT1_EXT0_ELi0ELi0EE(%struct.Mat6* noalias sret, %"struct.FixedMatrix<double,3,3,0,0>"*, %"struct.FixedMatrix<double,3,6,0,0>"*)

declare void @_ZmlIdLi6ELi1ELi6EE11FixedMatrixIT_XT0_EXT2_ELi0ELi0EERKS0_IS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT1_EXT2_ELi0ELi0EE(%struct.Mat6* noalias sret, %"struct.FixedMatrix<double,1,6,0,0>"*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZmlIdLi6ELi5ELi5EE11FixedMatrixIT_XT0_EXT2_ELi0ELi0EERKS0_IS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT1_EXT2_ELi0ELi0EE(%"struct.FixedMatrix<double,5,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,5,6,0,0>"*, %"struct.FixedMatrix<double,5,5,0,0>"*)

declare void @_Z14orthoTransformIdLi5ELi6EE11FixedMatrixIT_XT1_EXT1_ELi0ELi0EERKS0_IS1_XT0_EXT0_ELi0ELi0EERKS0_IS1_XT1_EXT0_ELi0ELi0EE(%struct.Mat6* noalias sret, %"struct.FixedMatrix<double,5,5,0,0>"*, %"struct.FixedMatrix<double,5,6,0,0>"*)

declare void @_Z14orthoTransformIdLi2ELi6EE11FixedMatrixIT_XT1_EXT1_ELi0ELi0EERKS0_IS1_XT0_EXT0_ELi0ELi0EERKS0_IS1_XT1_EXT0_ELi0ELi0EE(%struct.Mat6* noalias sret, %"struct.FixedMatrix<double,2,2,0,0>"*, %"struct.FixedMatrix<double,2,6,0,0>"*)

declare void @_ZmlIdLi1ELi6ELi6EE11FixedMatrixIT_XT0_EXT2_ELi0ELi0EERKS0_IS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT1_EXT2_ELi0ELi0EE(%"struct.FixedMatrix<double,1,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,1,6,0,0>"*, %struct.Mat6*)

declare void @_ZmlIdLi5ELi6ELi6EE11FixedMatrixIT_XT0_EXT2_ELi0ELi0EERKS0_IS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT1_EXT2_ELi0ELi0EE(%"struct.FixedMatrix<double,5,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,5,6,0,0>"*, %struct.Mat6*)

declare void @_Z14orthoTransformIdLi6ELi5EE11FixedMatrixIT_XT1_EXT1_ELi0ELi0EERKS0_IS1_XT0_EXT0_ELi0ELi0EERKS0_IS1_XT1_EXT0_ELi0ELi0EE(%"struct.FixedMatrix<double,5,5,0,0>"* noalias sret, %struct.Mat6*, %"struct.FixedMatrix<double,5,6,0,0>"*)

declare void @_ZmlIdLi2ELi6ELi6EE11FixedMatrixIT_XT0_EXT2_ELi0ELi0EERKS0_IS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT1_EXT2_ELi0ELi0EE(%"struct.FixedMatrix<double,2,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,2,6,0,0>"*, %struct.Mat6*)

declare void @_Z14orthoTransformIdLi6ELi2EE11FixedMatrixIT_XT1_EXT1_ELi0ELi0EERKS0_IS1_XT0_EXT0_ELi0ELi0EERKS0_IS1_XT1_EXT0_ELi0ELi0EE(%"struct.FixedMatrix<double,2,2,0,0>"* noalias sret, %struct.Mat6*, %"struct.FixedMatrix<double,2,6,0,0>"*)

declare void @_ZmlIdLi3ELi6ELi6EE11FixedMatrixIT_XT0_EXT2_ELi0ELi0EERKS0_IS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT1_EXT2_ELi0ELi0EE(%"struct.FixedMatrix<double,3,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,3,6,0,0>"*, %struct.Mat6*)

declare void @_Z14orthoTransformIdLi6ELi3EE11FixedMatrixIT_XT1_EXT1_ELi0ELi0EERKS0_IS1_XT0_EXT0_ELi0ELi0EERKS0_IS1_XT1_EXT0_ELi0ELi0EE(%"struct.FixedMatrix<double,3,3,0,0>"* noalias sret, %struct.Mat6*, %"struct.FixedMatrix<double,3,6,0,0>"*)

declare void @_ZNSt8ios_base4InitC1Ev(%"struct.CDS::DefaultAlloc"*)

declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) nounwind

declare void @__tcf_0(i8* nocapture)

declare void @_ZNSt8ios_base4InitD1Ev(%"struct.CDS::DefaultAlloc"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsRSoRK9HingeNode(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %struct.HingeNode*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsRSoPK7IVMAtom(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %struct.IVMAtom*)

declare void @_ZN9HingeNode8addChildEPS_(%struct.HingeNode*, %struct.HingeNode*)

declare void @_ZN7CDSListIP9HingeNodeE6appendES1_(%"struct.CDSList<HingeNode*>"*, %struct.HingeNode*)

declare void @_ZN9HingeNode4getHEv(%struct.RMat* noalias sret, %struct.HingeNode*)

declare i8* @__cxa_allocate_exception(i32) nounwind

declare void @__cxa_throw(i8*, i8*, void (i8*)*) noreturn

declare void @_ZN9HingeNode16getInternalForceER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HingeNode*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN9HingeNode9calcAccelEv(%struct.HingeNode*)

declare void @_ZN9HingeNode8getAccelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HingeNode*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN9HingeNode6getVelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HingeNode*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN9HingeNode6getPosER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HingeNode*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN9HingeNode5printEi(%struct.HingeNode*, i32)

declare void @_ZN9HingeNode18enforceConstraintsER9CDSVectorIdLi1EN3CDS12DefaultAllocEES4_(%struct.HingeNode*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN9HingeNode14setVelFromSVelERK11FixedVectorIdLi6ELi0EE(%struct.HingeNode*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZN9HingeNode6setVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HingeNode*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN9HingeNode9setPosVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEES5_(%struct.HingeNode*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN9HingeNode13propagateSVelERK11FixedVectorIdLi6ELi0EE(%struct.HingeNode*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZN9HingeNode18prepareVelInternalEv(%struct.HingeNode*)

declare void @_ZN9HingeNode17calcInternalForceEv(%struct.HingeNode*)

declare void @_ZN9HingeNode5calcYEv(%struct.HingeNode*)

declare void @_ZN9HingeNode9calcPandZEv(%struct.HingeNode*)

declare void @_ZN9HingeNode5calcZEv(%struct.HingeNode*)

declare void @_ZN9HingeNode5calcPEv(%struct.HingeNode*)

declare double* @_ZNK9HingeNode4massEv(%struct.HingeNode*)

declare %struct.Vec3* @_ZNK9HingeNode5posCMEv(%struct.HingeNode*)

declare i8* @_Znam(i32)

declare void @_ZN7CDSListIP9HingeNodeEC1Eii(%"struct.CDSList<HingeNode*>"*, i32, i32)

declare i8* @_Znwm(i32)

declare void @_ZdlPv(i8*) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

declare void @_ZN7CDSListIP7IVMAtomEC1Eii(%struct.AtomList*, i32, i32)

declare void @_ZN13CDSVectorBaseIdN3CDS12DefaultAllocEE8splitRepEv(%"struct.CDSVectorBase<double,CDS::DefaultAlloc>"*)

declare void @_ZN12HNodeTorsion16getInternalForceER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeTorsion*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi1EE8getAccelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<1>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi1EE6getVelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<1>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi1EE6getPosER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<1>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi1EE16getInternalForceER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<1>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN12HNodeRotate316getInternalForceER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeRotate3*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi3EE16getInternalForceER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<3>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi3EE8getAccelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<3>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi3EE6getVelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<3>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi3EE6getPosER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<3>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN12HNodeRotate216getInternalForceER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeRotate2*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN12HNodeRotate28getAccelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeRotate2*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN12HNodeRotate26getVelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeRotate2*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN12HNodeRotate26getPosER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeRotate2*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN12HNodeRotate38getAccelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeRotate3*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN12HNodeRotate36getVelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeRotate3*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN12HNodeRotate36getPosER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeRotate3*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi2EE16getInternalForceER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<2>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi2EE8getAccelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<2>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi2EE6getVelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<2>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi2EE6getPosER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<2>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN21HNodeTranslateRotate316getInternalForceER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeTranslateRotate3*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN21HNodeTranslateRotate38getAccelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeTranslateRotate3*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN21HNodeTranslateRotate36getVelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeTranslateRotate3*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN21HNodeTranslateRotate36getPosER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeTranslateRotate3*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi6EE16getInternalForceER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<6>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi6EE8getAccelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<6>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi6EE6getVelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<6>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi6EE6getPosER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<6>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN21HNodeTranslateRotate216getInternalForceER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeTranslateRotate2*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN21HNodeTranslateRotate28getAccelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeTranslateRotate2*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN21HNodeTranslateRotate26getVelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeTranslateRotate2*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN21HNodeTranslateRotate26getPosER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeTranslateRotate2*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi5EE16getInternalForceER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<5>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi5EE8getAccelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<5>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi5EE6getVelER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<5>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi5EE6getPosER9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<5>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13CDSVectorBaseI4Vec3N3CDS12DefaultAllocEE8splitRepEv(%"struct.CDSVectorBase<Vec3,CDS::DefaultAlloc>"*)

declare void @_ZN7CDSListIP7IVMAtomE8splitRepEv(%struct.AtomList*)

declare void @_ZN7CDSListIP9HingeNodeE8splitRepEv(%"struct.CDSList<HingeNode*>"*)

declare void @_ZdaPv(i8*) nounwind

declare void @_ZSt9terminatev() noreturn nounwind

declare void @_ZN9HingeNodeC2EPK3IVMP7IVMAtomPKS3_PS_(%struct.HingeNode*, %struct.IVM*, %struct.IVMAtom*, %struct.IVMAtom*, %struct.HingeNode*)

declare void @_ZN9HingeNodeD1Ev(%struct.HingeNode*)

declare void @_ZN9HingeNodeD0Ev(%struct.HingeNode*)

declare void @_ZN7CDSListIP7IVMAtomE6appendES1_(%struct.AtomList*, %struct.IVMAtom*)

declare void @_ZN9HingeNodeC1EPK3IVMP7IVMAtomPKS3_PS_(%struct.HingeNode*, %struct.IVM*, %struct.IVMAtom*, %struct.IVMAtom*, %struct.HingeNode*)

declare void @_ZN9HingeNodeD2Ev(%struct.HingeNode*)

declare void @_ZN11HNodeOriginD0Ev(%struct.HNodeOrigin*)

declare void @_ZN11HNodeOriginD1Ev(%struct.HNodeOrigin*)

declare void @_ZN13HingeNodeSpecILi1EED0Ev(%"struct.HingeNodeSpec<1>"*)

declare void @_ZN13HingeNodeSpecILi1EED1Ev(%"struct.HingeNodeSpec<1>"*)

declare void @_ZN13HingeNodeSpecILi1EE5calcPEv(%"struct.HingeNodeSpec<1>"*)

declare void @_ZN13HingeNodeSpecILi1EE5calcZEv(%"struct.HingeNodeSpec<1>"*)

declare void @_ZN13HingeNodeSpecILi1EE5calcYEv(%"struct.HingeNodeSpec<1>"*)

declare void @_ZN13HingeNodeSpecILi1EE17calcInternalForceEv(%"struct.HingeNodeSpec<1>"*)

declare void @_ZN13HingeNodeSpecILi1EE18prepareVelInternalEv(%"struct.HingeNodeSpec<1>"*)

declare void @_ZN13HingeNodeSpecILi1EE13propagateSVelERK11FixedVectorIdLi6ELi0EE(%"struct.HingeNodeSpec<1>"*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare double @_ZN13HingeNodeSpecILi1EE8approxKEEv(%"struct.HingeNodeSpec<1>"*)

declare void @_ZN13HingeNodeSpecILi1EE6setVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<1>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi1EE14setVelFromSVelERK11FixedVectorIdLi6ELi0EE(%"struct.HingeNodeSpec<1>"*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZN13HingeNodeSpecILi1EE5printEi(%"struct.HingeNodeSpec<1>"*, i32)

declare void @_ZN13HingeNodeSpecILi1EE9calcAccelEv(%"struct.HingeNodeSpec<1>"*)

declare void @_ZN13HingeNodeSpecILi1EE4getHEv(%struct.RMat* noalias sret, %"struct.HingeNodeSpec<1>"*)

declare void @__cxa_pure_virtual() nounwind

declare void @_ZN13HingeNodeSpecILi3EED0Ev(%"struct.HingeNodeSpec<3>"*)

declare void @_ZN13HingeNodeSpecILi3EED1Ev(%"struct.HingeNodeSpec<3>"*)

declare void @_ZN13HingeNodeSpecILi3EE5calcPEv(%"struct.HingeNodeSpec<3>"*)

declare void @_ZN13HingeNodeSpecILi3EE5calcZEv(%"struct.HingeNodeSpec<3>"*)

declare void @_ZN13HingeNodeSpecILi3EE5calcYEv(%"struct.HingeNodeSpec<3>"*)

declare void @_ZN13HingeNodeSpecILi3EE17calcInternalForceEv(%"struct.HingeNodeSpec<3>"*)

declare void @_ZN13HingeNodeSpecILi3EE18prepareVelInternalEv(%"struct.HingeNodeSpec<3>"*)

declare void @_ZN13HingeNodeSpecILi3EE13propagateSVelERK11FixedVectorIdLi6ELi0EE(%"struct.HingeNodeSpec<3>"*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare double @_ZN13HingeNodeSpecILi3EE8approxKEEv(%"struct.HingeNodeSpec<3>"*)

declare void @_ZN13HingeNodeSpecILi3EE6setVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<3>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi3EE14setVelFromSVelERK11FixedVectorIdLi6ELi0EE(%"struct.HingeNodeSpec<3>"*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZN13HingeNodeSpecILi3EE5printEi(%"struct.HingeNodeSpec<3>"*, i32)

declare void @_ZN13HingeNodeSpecILi3EE9calcAccelEv(%"struct.HingeNodeSpec<3>"*)

declare void @_ZN13HingeNodeSpecILi3EE4getHEv(%struct.RMat* noalias sret, %"struct.HingeNodeSpec<3>"*)

declare void @_ZN13HingeNodeSpecILi2EED0Ev(%"struct.HingeNodeSpec<2>"*)

declare void @_ZN13HingeNodeSpecILi2EED1Ev(%"struct.HingeNodeSpec<2>"*)

declare void @_ZN13HingeNodeSpecILi2EE5calcPEv(%"struct.HingeNodeSpec<2>"*)

declare void @_ZN13HingeNodeSpecILi2EE5calcZEv(%"struct.HingeNodeSpec<2>"*)

declare void @_ZN13HingeNodeSpecILi2EE5calcYEv(%"struct.HingeNodeSpec<2>"*)

declare void @_ZN13HingeNodeSpecILi2EE17calcInternalForceEv(%"struct.HingeNodeSpec<2>"*)

declare void @_ZN13HingeNodeSpecILi2EE18prepareVelInternalEv(%"struct.HingeNodeSpec<2>"*)

declare void @_ZN13HingeNodeSpecILi2EE13propagateSVelERK11FixedVectorIdLi6ELi0EE(%"struct.HingeNodeSpec<2>"*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare double @_ZN13HingeNodeSpecILi2EE8approxKEEv(%"struct.HingeNodeSpec<2>"*)

declare void @_ZN13HingeNodeSpecILi2EE6setVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<2>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi2EE14setVelFromSVelERK11FixedVectorIdLi6ELi0EE(%"struct.HingeNodeSpec<2>"*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZN13HingeNodeSpecILi2EE5printEi(%"struct.HingeNodeSpec<2>"*, i32)

declare void @_ZN13HingeNodeSpecILi2EE9calcAccelEv(%"struct.HingeNodeSpec<2>"*)

declare void @_ZN13HingeNodeSpecILi2EE4getHEv(%struct.RMat* noalias sret, %"struct.HingeNodeSpec<2>"*)

declare void @_ZN13HingeNodeSpecILi6EED0Ev(%"struct.HingeNodeSpec<6>"*)

declare void @_ZN13HingeNodeSpecILi6EED1Ev(%"struct.HingeNodeSpec<6>"*)

declare void @_ZN13HingeNodeSpecILi6EE5calcPEv(%"struct.HingeNodeSpec<6>"*)

declare void @_ZN13HingeNodeSpecILi6EE5calcZEv(%"struct.HingeNodeSpec<6>"*)

declare void @_ZN13HingeNodeSpecILi6EE5calcYEv(%"struct.HingeNodeSpec<6>"*)

declare void @_ZN13HingeNodeSpecILi6EE17calcInternalForceEv(%"struct.HingeNodeSpec<6>"*)

declare void @_ZN13HingeNodeSpecILi6EE18prepareVelInternalEv(%"struct.HingeNodeSpec<6>"*)

declare void @_ZN13HingeNodeSpecILi6EE13propagateSVelERK11FixedVectorIdLi6ELi0EE(%"struct.HingeNodeSpec<6>"*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare double @_ZN13HingeNodeSpecILi6EE8approxKEEv(%"struct.HingeNodeSpec<6>"*)

declare void @_ZN13HingeNodeSpecILi6EE6setVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<6>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi6EE14setVelFromSVelERK11FixedVectorIdLi6ELi0EE(%"struct.HingeNodeSpec<6>"*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZN13HingeNodeSpecILi6EE5printEi(%"struct.HingeNodeSpec<6>"*, i32)

declare void @_ZN13HingeNodeSpecILi6EE9calcAccelEv(%"struct.HingeNodeSpec<6>"*)

declare void @_ZN13HingeNodeSpecILi6EE4getHEv(%struct.RMat* noalias sret, %"struct.HingeNodeSpec<6>"*)

declare void @_ZN13HingeNodeSpecILi5EED0Ev(%"struct.HingeNodeSpec<5>"*)

declare void @_ZN13HingeNodeSpecILi5EED1Ev(%"struct.HingeNodeSpec<5>"*)

declare void @_ZN13HingeNodeSpecILi5EE5calcPEv(%"struct.HingeNodeSpec<5>"*)

declare void @_ZN13HingeNodeSpecILi5EE5calcZEv(%"struct.HingeNodeSpec<5>"*)

declare void @_ZN13HingeNodeSpecILi5EE5calcYEv(%"struct.HingeNodeSpec<5>"*)

declare void @_ZN13HingeNodeSpecILi5EE17calcInternalForceEv(%"struct.HingeNodeSpec<5>"*)

declare void @_ZN13HingeNodeSpecILi5EE18prepareVelInternalEv(%"struct.HingeNodeSpec<5>"*)

declare void @_ZN13HingeNodeSpecILi5EE13propagateSVelERK11FixedVectorIdLi6ELi0EE(%"struct.HingeNodeSpec<5>"*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare double @_ZN13HingeNodeSpecILi5EE8approxKEEv(%"struct.HingeNodeSpec<5>"*)

declare void @_ZN13HingeNodeSpecILi5EE6setVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%"struct.HingeNodeSpec<5>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi5EE14setVelFromSVelERK11FixedVectorIdLi6ELi0EE(%"struct.HingeNodeSpec<5>"*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZN13HingeNodeSpecILi5EE5printEi(%"struct.HingeNodeSpec<5>"*, i32)

declare void @_ZN13HingeNodeSpecILi5EE9calcAccelEv(%"struct.HingeNodeSpec<5>"*)

declare void @_ZN13HingeNodeSpecILi5EE4getHEv(%struct.RMat* noalias sret, %"struct.HingeNodeSpec<5>"*)

declare void @_ZN12HNodeTorsion7calcRotEv(%struct.HNodeTorsion*)

declare double @sin(double) nounwind readnone

declare double @cos(double) nounwind readnone

declare void @_ZN12HNodeRotate37calcRotEv(%struct.HNodeRotate3*)

declare void @_ZN21HNodeTranslateRotate37calcRotEv(%struct.HNodeTranslateRotate3*)

declare void @_ZN9HingeNodeC2ERKS_(%struct.HingeNode*, %struct.HingeNode*)

declare void @_ZN7CDSListIP9HingeNodeEC1ERKS2_(%"struct.CDSList<HingeNode*>"*, %"struct.CDSList<HingeNode*>"*)

declare void @_ZN7CDSListIP7IVMAtomEC1ERKS2_(%struct.AtomList*, %struct.AtomList*)

declare void @_ZN11HNodeOriginC2EPK9HingeNode(%struct.HNodeOrigin*, %struct.HingeNode*)

declare void @_ZN13HingeNodeSpecILi1EEC2EPK9HingeNodeRi(%"struct.HingeNodeSpec<1>"*, %struct.HingeNode*, i32*)

declare void @_ZN13HingeNodeSpecILi3EEC2EPK9HingeNodeRi(%"struct.HingeNodeSpec<3>"*, %struct.HingeNode*, i32*)

declare void @_ZN13HingeNodeSpecILi2EEC2EPK9HingeNodeRi(%"struct.HingeNodeSpec<2>"*, %struct.HingeNode*, i32*)

declare void @_ZN13HingeNodeSpecILi6EEC2EPK9HingeNodeRi(%"struct.HingeNodeSpec<6>"*, %struct.HingeNode*, i32*)

declare void @_ZN13HingeNodeSpecILi5EEC2EPK9HingeNodeRi(%"struct.HingeNodeSpec<5>"*, %struct.HingeNode*, i32*)

declare void @_ZplI4Vec3K11FixedVectorIdLi6ELi0EEET_RK9SubVectorIT0_ERKS4_(%struct.Vec3* noalias sret, %"struct.SubVector<FixedVector<double, 6, 0> >"*, %struct.Vec3*)

declare void @_ZN11MatrixTools9transposeI11FixedMatrixIdLi1ELi6ELi0ELi0EEEENT_13TransposeTypeERKS3_(%"struct.FixedMatrix<double,1,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZN12HNodeRotate314setVelFromSVelERK11FixedVectorIdLi6ELi0EE(%struct.HNodeRotate3*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZN12HNodeRotate214setVelFromSVelERK11FixedVectorIdLi6ELi0EE(%struct.HNodeRotate2*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZN21HNodeTranslateRotate314setVelFromSVelERK11FixedVectorIdLi6ELi0EE(%struct.HNodeTranslateRotate3*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZN21HNodeTranslateRotate214setVelFromSVelERK11FixedVectorIdLi6ELi0EE(%struct.HNodeTranslateRotate2*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZN13HingeNodeSpecILi1EE9calcPropsEv(%"struct.HingeNodeSpec<1>"*)

declare zeroext i8 @_ZNK3IVM12minimizationEv(%struct.IVM*)

declare void @_Z8blockVecIdLi3ELi3EE11FixedVectorIT_XplT0_T1_ELi0EERKS0_IS1_XT0_ELi0EERKS0_IS1_XT1_ELi0EE(%"struct.FixedMatrix<double,1,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,1,3,0,0>"*, %"struct.FixedMatrix<double,1,3,0,0>"*)

declare void @_ZN12HNodeTorsion11toCartesianEv(%struct.HNodeTorsion*)

declare void @_ZN13HingeNodeSpecILi1EE18calcCartesianForceEv(%"struct.HingeNodeSpec<1>"*)

declare void @_ZN13HingeNodeSpecILi3EE18calcCartesianForceEv(%"struct.HingeNodeSpec<3>"*)

declare void @_ZN13HingeNodeSpecILi2EE18calcCartesianForceEv(%"struct.HingeNodeSpec<2>"*)

declare void @_ZN13HingeNodeSpecILi6EE18calcCartesianForceEv(%"struct.HingeNodeSpec<6>"*)

declare void @_ZN13HingeNodeSpecILi5EE18calcCartesianForceEv(%"struct.HingeNodeSpec<5>"*)

declare void @_ZN12HNodeTorsion5calcHEv(%struct.HNodeTorsion*)

declare void @_Z10blockMat12IdLi1ELi3ELi3EE11FixedMatrixIT_XT0_EXplT1_T2_ELi0ELi0EERKS0_IS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT0_EXT2_ELi0ELi0EE(%"struct.FixedMatrix<double,1,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,1,3,0,0>"*, %"struct.FixedMatrix<double,1,3,0,0>"*)

declare void @_ZN13CDSMatrixBaseIdEC2I11FixedMatrixIdLi1ELi6ELi0ELi0EEEERKT_(%"struct.CDSMatrixBase<double>"*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZN11MatrixTools9transposeI11FixedMatrixIdLi6ELi1ELi0ELi0EEEENT_13TransposeTypeERKS3_(%"struct.FixedMatrix<double,1,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St13_Setprecision(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, i32)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIdLi6EERSoS0_RK15FixedVectorBaseIT_XT0_EE(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.FixedMatrixBase<double,1,6>"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, i8 signext)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIdLi3EERSoS0_RK15FixedVectorBaseIT_XT0_EE(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.FixedMatrixBase<double,1,3>"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIdLi1EERSoS0_RK15FixedVectorBaseIT_XT0_EE(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.FixedMatrixBase<double,1,1>"*)

declare void @_ZN11FixedVectorIdLi3ELi0EE6subColILi6ELi1ELi0ELi0EEES0_RK11FixedMatrixIdXT_EXT0_EXT1_EXT2_EEiii(%"struct.FixedMatrix<double,1,3,0,0>"* noalias sret, %"struct.FixedMatrix<double,1,6,0,0>"*, i32, i32, i32)

declare %"struct.FixedMatrixBase<double,6,6>"* @_ZN15FixedMatrixBaseIdLi6ELi6EEpLERKS0_(%"struct.FixedMatrixBase<double,6,6>"*, %"struct.FixedMatrixBase<double,6,6>"*)

declare void @_ZN13HingeNodeSpecILi6EE9calcPropsEv(%"struct.HingeNodeSpec<6>"*)

declare void @_ZN11MatrixTools9transposeI11FixedMatrixIdLi6ELi6ELi0ELi0EEEENT_13TransposeTypeERKS3_(%struct.Mat6* noalias sret, %struct.Mat6*)

declare void @_ZN21HNodeTranslateRotate311toCartesianEv(%struct.HNodeTranslateRotate3*)

define linkonce void @_ZN21HNodeTranslateRotate36setVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeTranslateRotate3* %this, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"* %velv) {
	%1 = getelementptr double, double* null, i32 -1		; <double*> [#uses=1]
	%2 = load double, double* %1, align 8		; <double> [#uses=1]
	%3 = load double, double* null, align 8		; <double> [#uses=2]
	%4 = load double, double* null, align 8		; <double> [#uses=2]
	%5 = load double, double* null, align 8		; <double> [#uses=3]
	%6 = getelementptr %struct.HNodeTranslateRotate3, %struct.HNodeTranslateRotate3* %this, i32 0, i32 2, i32 0, i32 0, i32 0, i32 0		; <double*> [#uses=0]
	%7 = getelementptr %struct.HNodeTranslateRotate3, %struct.HNodeTranslateRotate3* %this, i32 0, i32 2, i32 0, i32 0, i32 0, i32 1		; <double*> [#uses=0]
	%8 = getelementptr %struct.HNodeTranslateRotate3, %struct.HNodeTranslateRotate3* %this, i32 0, i32 2, i32 0, i32 0, i32 0, i32 2		; <double*> [#uses=0]
	%9 = getelementptr %struct.HNodeTranslateRotate3, %struct.HNodeTranslateRotate3* %this, i32 0, i32 2, i32 0, i32 0, i32 0, i32 3		; <double*> [#uses=0]
	%10 = load double, double* null, align 8		; <double> [#uses=2]
	%11 = fsub double -0.000000e+00, %10		; <double> [#uses=1]
	%12 = load double, double* null, align 8		; <double> [#uses=2]
	%13 = getelementptr %struct.HNodeTranslateRotate3, %struct.HNodeTranslateRotate3* %this, i32 0, i32 1, i32 0, i32 0, i32 0, i32 3		; <double*> [#uses=1]
	%14 = load double, double* %13, align 8		; <double> [#uses=2]
	%15 = fsub double -0.000000e+00, %14		; <double> [#uses=1]
	%16 = getelementptr %struct.HNodeTranslateRotate3, %struct.HNodeTranslateRotate3* %this, i32 0, i32 1, i32 0, i32 0, i32 0, i32 2		; <double*> [#uses=1]
	%17 = load double, double* %16, align 8		; <double> [#uses=2]
	%18 = fsub double -0.000000e+00, %17		; <double> [#uses=1]
	%19 = getelementptr %"struct.FixedMatrix<double,2,6,0,0>", %"struct.FixedMatrix<double,2,6,0,0>"* null, i32 0, i32 0, i32 0, i32 0		; <double*> [#uses=0]
	%20 = getelementptr %"struct.FixedMatrix<double,2,6,0,0>", %"struct.FixedMatrix<double,2,6,0,0>"* null, i32 0, i32 0, i32 0, i32 3		; <double*> [#uses=0]
	%21 = getelementptr %"struct.FixedMatrix<double,2,6,0,0>", %"struct.FixedMatrix<double,2,6,0,0>"* null, i32 0, i32 0, i32 0, i32 6		; <double*> [#uses=0]
	%22 = getelementptr %"struct.FixedMatrix<double,2,6,0,0>", %"struct.FixedMatrix<double,2,6,0,0>"* null, i32 0, i32 0, i32 0, i32 9		; <double*> [#uses=0]
	%23 = getelementptr %"struct.FixedMatrix<double,2,6,0,0>", %"struct.FixedMatrix<double,2,6,0,0>"* null, i32 0, i32 0, i32 0, i32 1		; <double*> [#uses=0]
	%24 = getelementptr %"struct.FixedMatrix<double,2,6,0,0>", %"struct.FixedMatrix<double,2,6,0,0>"* null, i32 0, i32 0, i32 0, i32 4		; <double*> [#uses=0]
	%25 = getelementptr %"struct.FixedMatrix<double,2,6,0,0>", %"struct.FixedMatrix<double,2,6,0,0>"* null, i32 0, i32 0, i32 0, i32 7		; <double*> [#uses=0]
	%26 = getelementptr %"struct.FixedMatrix<double,2,6,0,0>", %"struct.FixedMatrix<double,2,6,0,0>"* null, i32 0, i32 0, i32 0, i32 10		; <double*> [#uses=0]
	%27 = getelementptr %"struct.FixedMatrix<double,2,6,0,0>", %"struct.FixedMatrix<double,2,6,0,0>"* null, i32 0, i32 0, i32 0, i32 2		; <double*> [#uses=0]
	%28 = getelementptr %"struct.FixedMatrix<double,2,6,0,0>", %"struct.FixedMatrix<double,2,6,0,0>"* null, i32 0, i32 0, i32 0, i32 5		; <double*> [#uses=0]
	%29 = getelementptr %"struct.FixedMatrix<double,2,6,0,0>", %"struct.FixedMatrix<double,2,6,0,0>"* null, i32 0, i32 0, i32 0, i32 8		; <double*> [#uses=0]
	%30 = getelementptr %"struct.FixedMatrix<double,2,6,0,0>", %"struct.FixedMatrix<double,2,6,0,0>"* null, i32 0, i32 0, i32 0, i32 11		; <double*> [#uses=0]
	%31 = getelementptr %"struct.FixedMatrix<double,1,3,0,0>", %"struct.FixedMatrix<double,1,3,0,0>"* null, i32 0, i32 0, i32 0, i32 0		; <double*> [#uses=0]
	%32 = getelementptr %"struct.FixedMatrix<double,1,3,0,0>", %"struct.FixedMatrix<double,1,3,0,0>"* null, i32 0, i32 0, i32 0, i32 1		; <double*> [#uses=1]
	%33 = getelementptr %"struct.FixedMatrix<double,1,3,0,0>", %"struct.FixedMatrix<double,1,3,0,0>"* null, i32 0, i32 0, i32 0, i32 2		; <double*> [#uses=1]
	%34 = fmul double %17, %5		; <double> [#uses=1]
	%35 = fadd double 0.000000e+00, %34		; <double> [#uses=1]
	%36 = fadd double 0.000000e+00, 0.000000e+00		; <double> [#uses=1]
	%37 = fmul double %14, %3		; <double> [#uses=1]
	%38 = fadd double %36, %37		; <double> [#uses=1]
	%39 = fmul double %12, %4		; <double> [#uses=1]
	%40 = fadd double %38, %39		; <double> [#uses=1]
	%41 = fmul double %5, %11		; <double> [#uses=1]
	%42 = fadd double %40, %41		; <double> [#uses=2]
	store double %42, double* %32, align 8
	%43 = fmul double %2, %15		; <double> [#uses=1]
	%44 = fadd double %43, 0.000000e+00		; <double> [#uses=1]
	%45 = fmul double %3, %18		; <double> [#uses=1]
	%46 = fadd double %44, %45		; <double> [#uses=1]
	%47 = fmul double %10, %4		; <double> [#uses=1]
	%48 = fadd double %46, %47		; <double> [#uses=1]
	%49 = fmul double %12, %5		; <double> [#uses=1]
	%50 = fadd double %48, %49		; <double> [#uses=2]
	store double %50, double* %33, align 8
	%51 = fmul double %35, 2.000000e+00		; <double> [#uses=1]
	%52 = fmul double %42, 2.000000e+00		; <double> [#uses=1]
	%53 = fmul double %50, 2.000000e+00		; <double> [#uses=1]
	%54 = getelementptr %struct.HNodeTranslateRotate3, %struct.HNodeTranslateRotate3* %this, i32 0, i32 0, i32 10, i32 0, i32 0, i32 0		; <double*> [#uses=1]
	store double %51, double* %54, align 8
	%55 = getelementptr %struct.HNodeTranslateRotate3, %struct.HNodeTranslateRotate3* %this, i32 0, i32 0, i32 10, i32 0, i32 0, i32 1		; <double*> [#uses=1]
	store double %52, double* %55, align 8
	%56 = getelementptr %struct.HNodeTranslateRotate3, %struct.HNodeTranslateRotate3* %this, i32 0, i32 0, i32 10, i32 0, i32 0, i32 2		; <double*> [#uses=1]
	store double %53, double* %56, align 8
	%57 = getelementptr %"struct.SubVector<CDSVector<double, 1, CDS::DefaultAlloc> >", %"struct.SubVector<CDSVector<double, 1, CDS::DefaultAlloc> >"* null, i32 0, i32 0		; <%"struct.CDSVector<double,0,CDS::DefaultAlloc>"**> [#uses=1]
	store %"struct.CDSVector<double,0,CDS::DefaultAlloc>"* %velv, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"** %57, align 8
	%58 = getelementptr %"struct.SubVector<CDSVector<double, 1, CDS::DefaultAlloc> >", %"struct.SubVector<CDSVector<double, 1, CDS::DefaultAlloc> >"* null, i32 0, i32 1		; <i32*> [#uses=1]
	store i32 4, i32* %58, align 4
	%59 = getelementptr %"struct.SubVector<CDSVector<double, 1, CDS::DefaultAlloc> >", %"struct.SubVector<CDSVector<double, 1, CDS::DefaultAlloc> >"* null, i32 0, i32 2		; <i32*> [#uses=1]
	store i32 3, i32* %59, align 8
	unreachable
}

declare void @_ZmlRK11FixedMatrixIdLi6ELi6ELi0ELi0EERK18PhiMatrixTranspose(%struct.Mat6* noalias sret, %struct.Mat6*, %struct.PhiMatrixTranspose*)

declare void @_ZmlI4Mat3K11FixedMatrixIdLi6ELi6ELi0ELi0EEET_RK9SubMatrixIT0_ERKS4_(%struct.Mat3* noalias sret, %"struct.SubMatrix<FixedMatrix<double, 6, 6, 0, 0> >"*, %struct.Mat3*)

declare void @_ZmiI4Mat3K11FixedMatrixIdLi6ELi6ELi0ELi0EEET_RK9SubMatrixIT0_ERKS4_(%struct.Mat3* noalias sret, %"struct.SubMatrix<FixedMatrix<double, 6, 6, 0, 0> >"*, %struct.Mat3*)

declare %"struct.FixedMatrixBase<double,3,3>"* @_ZN15FixedMatrixBaseIdLi3ELi3EEmIERKS0_(%"struct.FixedMatrixBase<double,3,3>"*, %"struct.FixedMatrixBase<double,3,3>"*)

declare void @_ZplI4Mat311FixedMatrixIdLi6ELi6ELi0ELi0EEET_RKS3_RK9SubMatrixIT0_E(%struct.Mat3* noalias sret, %struct.Mat3*, %"struct.SubMatrix<FixedMatrix<double, 6, 6, 0, 0> >"*)

declare void @_ZN13CDSVectorBaseIdN3CDS12DefaultAllocEED2Ev(%"struct.CDSVectorBase<double,CDS::DefaultAlloc>"*)

declare void @_ZN13HingeNodeSpecILi1EE7calcD_GERK11FixedMatrixIdLi6ELi6ELi0ELi0EE(%"struct.HingeNodeSpec<1>"*, %struct.Mat6*)

declare void @_ZN11MatrixTools7inverseI11FixedMatrixIdLi1ELi1ELi0ELi0EEEET_RKS3_NS_14InverseResultsINS3_10MatrixTypeEEE(%"struct.FixedMatrix<double,1,1,0,0>"* noalias sret, %"struct.FixedMatrix<double,1,1,0,0>"*, %"struct.MatrixTools::InverseResults<FullMatrix<double> >"*)

declare i8* @__cxa_get_exception_ptr(i8*) nounwind

declare i8* @__cxa_begin_catch(i8*) nounwind

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIdLi1ELi1EERSoS0_RK15FixedMatrixBaseIT_XT0_EXT1_EE(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.FixedMatrixBase<double,1,1>"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIdLi1ELi6EERSoS0_RK15FixedMatrixBaseIT_XT0_EXT1_EE(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.FixedMatrixBase<double,1,6>"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZNSolsEi(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, i32)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIcERSoS0_RK9CDSStringIT_E(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %struct.String*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZNSolsEPFRSoS_E(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.std::basic_ostream<char,std::char_traits<char> >"* (%"struct.std::basic_ostream<char,std::char_traits<char> >"*)*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"struct.std::basic_ostream<char,std::char_traits<char> >"*)

declare void @__cxa_end_catch()

declare void @_ZmlI4Mat311FixedMatrixIdLi6ELi6ELi0ELi0EEET_RKS3_RK9SubMatrixIT0_E(%struct.Mat3* noalias sret, %struct.Mat3*, %"struct.SubMatrix<FixedMatrix<double, 6, 6, 0, 0> >"*)

declare void @_ZmlI4Mat311FixedMatrixIdLi6ELi6ELi0ELi0EEET_RK9SubMatrixIT0_ERKS3_(%struct.Mat3* noalias sret, %"struct.SubMatrix<FixedMatrix<double, 6, 6, 0, 0> >"*, %struct.Mat3*)

declare void @_ZmiI4Mat311FixedMatrixIdLi6ELi6ELi0ELi0EEET_RK9SubMatrixIT0_ERKS3_(%struct.Mat3* noalias sret, %"struct.SubMatrix<FixedMatrix<double, 6, 6, 0, 0> >"*, %struct.Mat3*)

declare %"struct.FixedMatrixBase<double,6,6>"* @_ZN15FixedMatrixBaseIdLi6ELi6EEmIERKS0_(%"struct.FixedMatrixBase<double,6,6>"*, %"struct.FixedMatrixBase<double,6,6>"*)

declare void @_ZN13CDSVectorBaseI4Vec3N3CDS12DefaultAllocEEC2EiS2_(%"struct.CDSVectorBase<Vec3,CDS::DefaultAlloc>"*, i32, %"struct.CDS::DefaultAlloc"* byval align 4)

declare void @_ZN13CDSVectorBaseI4Vec3N3CDS12DefaultAllocEED2Ev(%"struct.CDSVectorBase<Vec3,CDS::DefaultAlloc>"*)

declare void @_ZN12HNodeTorsionD0Ev(%struct.HNodeTorsion*)

declare void @_ZN12HNodeTorsionD1Ev(%struct.HNodeTorsion*)

declare void @_ZN12HNodeRotate3D0Ev(%struct.HNodeRotate3*)

declare void @_ZN12HNodeRotate3D1Ev(%struct.HNodeRotate3*)

declare void @_ZN12HNodeRotate36setVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeRotate3*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN12HNodeRotate318enforceConstraintsER9CDSVectorIdLi1EN3CDS12DefaultAllocEES4_(%struct.HNodeRotate3*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN12HNodeRotate35printEi(%struct.HNodeRotate3*, i32)

declare void @_ZN12HNodeRotate35calcHEv(%struct.HNodeRotate3*)

declare void @_ZN12HNodeRotate311toCartesianEv(%struct.HNodeRotate3*)

declare void @_ZN12HNodeRotate2D0Ev(%struct.HNodeRotate2*)

declare void @_ZN12HNodeRotate2D1Ev(%struct.HNodeRotate2*)

declare void @_ZN12HNodeRotate26setVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeRotate2*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN12HNodeRotate218enforceConstraintsER9CDSVectorIdLi1EN3CDS12DefaultAllocEES4_(%struct.HNodeRotate2*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN12HNodeRotate25printEi(%struct.HNodeRotate2*, i32)

declare void @_ZN12HNodeRotate25calcHEv(%struct.HNodeRotate2*)

declare void @_ZN12HNodeRotate211toCartesianEv(%struct.HNodeRotate2*)

declare void @_ZN21HNodeTranslateRotate3D0Ev(%struct.HNodeTranslateRotate3*)

declare void @_ZN21HNodeTranslateRotate3D1Ev(%struct.HNodeTranslateRotate3*)

declare void @_ZN21HNodeTranslateRotate318enforceConstraintsER9CDSVectorIdLi1EN3CDS12DefaultAllocEES4_(%struct.HNodeTranslateRotate3*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN21HNodeTranslateRotate35printEi(%struct.HNodeTranslateRotate3*, i32)

declare void @_ZN21HNodeTranslateRotate35calcHEv(%struct.HNodeTranslateRotate3*)

declare void @_ZN21HNodeTranslateRotate2D0Ev(%struct.HNodeTranslateRotate2*)

declare void @_ZN21HNodeTranslateRotate2D1Ev(%struct.HNodeTranslateRotate2*)

declare void @_ZN21HNodeTranslateRotate26setVelERK9CDSVectorIdLi1EN3CDS12DefaultAllocEE(%struct.HNodeTranslateRotate2*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN21HNodeTranslateRotate218enforceConstraintsER9CDSVectorIdLi1EN3CDS12DefaultAllocEES4_(%struct.HNodeTranslateRotate2*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*, %"struct.CDSVector<double,0,CDS::DefaultAlloc>"*)

declare void @_ZN21HNodeTranslateRotate25printEi(%struct.HNodeTranslateRotate2*, i32)

declare void @_ZN21HNodeTranslateRotate25calcHEv(%struct.HNodeTranslateRotate2*)

declare void @_ZN21HNodeTranslateRotate211toCartesianEv(%struct.HNodeTranslateRotate2*)

declare void @_ZN14HNodeTranslateC2EPK9HingeNodeP7IVMAtomRi(%struct.HNodeTranslate*, %struct.HingeNode*, %struct.IVMAtom*, i32*)

declare void @_ZN14HNodeTranslateD1Ev(%struct.HNodeTranslate*)

declare void @_ZN14HNodeTranslateD0Ev(%struct.HNodeTranslate*)

declare void @_ZN14HNodeTranslate5calcHEv(%struct.HNodeTranslate*)

declare void @_ZN14HNodeTranslate11toCartesianEv(%struct.HNodeTranslate*)

declare void @_ZN12HNodeRotate3C2EPK9HingeNodeP7IVMAtomRib(%struct.HNodeRotate3*, %struct.HingeNode*, %struct.IVMAtom*, i32*, i8 zeroext)

declare void @_ZN8AtomTree6findCMEPK9HingeNode(%struct.Vec3* noalias sret, %struct.HingeNode*)

declare %struct.IVMAtom** @_ZN7CDSListIP7IVMAtomE7prependERKS1_(%struct.AtomList*, %struct.IVMAtom**)

declare %"struct.CDSVectorBase<Vec3,CDS::DefaultAlloc>"* @_ZN13CDSVectorBaseI4Vec3N3CDS12DefaultAllocEE6resizeEi(%"struct.CDSVectorBase<Vec3,CDS::DefaultAlloc>"*, i32)

declare void @_ZN12HNodeRotate2C2EPK9HingeNodeRK4Vec3Ri(%struct.HNodeRotate2*, %struct.HingeNode*, %struct.Vec3*, i32*)

declare void @_ZN21HNodeTranslateRotate3C2EPK9HingeNodeP7IVMAtomRib(%struct.HNodeTranslateRotate3*, %struct.HingeNode*, %struct.IVMAtom*, i32*, i8 zeroext)

declare void @_ZN13HingeNodeSpecILi3EE9calcPropsEv(%"struct.HingeNodeSpec<3>"*)

declare void @_ZN11MatrixTools9transposeI11FixedMatrixIdLi3ELi6ELi0ELi0EEEENT_13TransposeTypeERKS3_(%"struct.FixedMatrix<double,3,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,3,6,0,0>"*)

declare void @_ZN11MatrixTools9transposeI4Mat3EENT_13TransposeTypeERKS2_(%struct.Mat3* noalias sret, %struct.Mat3*)

declare void @_Z10blockMat12IdLi3ELi3ELi3EE11FixedMatrixIT_XT0_EXplT1_T2_ELi0ELi0EERKS0_IS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT0_EXT2_ELi0ELi0EE(%"struct.FixedMatrix<double,3,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,3,3,0,0>"*, %"struct.FixedMatrix<double,3,3,0,0>"*)

declare void @_ZN13CDSMatrixBaseIdEC2I11FixedMatrixIdLi3ELi6ELi0ELi0EEEERKT_(%"struct.CDSMatrixBase<double>"*, %"struct.FixedMatrix<double,3,6,0,0>"*)

declare void @_ZN11MatrixTools9transposeI11FixedMatrixIdLi6ELi3ELi0ELi0EEEENT_13TransposeTypeERKS3_(%"struct.FixedMatrix<double,3,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,3,6,0,0>"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIdLi4EERSoS0_RK15FixedVectorBaseIT_XT0_EE(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.FixedMatrixBase<double,2,2>"*)

declare double @_Z4normIdLi4EET_RK11FixedVectorIS0_XT0_ELi0EE(%"struct.FixedMatrix<double,2,2,0,0>"*)

declare %"struct.FixedMatrixBase<double,2,2>"* @_ZN15FixedVectorBaseIdLi4EEdVERKd(%"struct.FixedMatrixBase<double,2,2>"*, double*)

declare %"struct.FixedMatrixBase<double,2,2>"* @_ZN15FixedVectorBaseIdLi4EEmIERKS0_(%"struct.FixedMatrixBase<double,2,2>"*, %"struct.FixedMatrixBase<double,2,2>"*)

declare void @_ZN11FixedVectorIdLi3ELi0EE6subColILi6ELi3ELi0ELi0EEES0_RK11FixedMatrixIdXT_EXT0_EXT1_EXT2_EEiii(%"struct.FixedMatrix<double,1,3,0,0>"* noalias sret, %"struct.FixedMatrix<double,3,6,0,0>"*, i32, i32, i32)

declare void @_ZN13HingeNodeSpecILi3EE7calcD_GERK11FixedMatrixIdLi6ELi6ELi0ELi0EE(%"struct.HingeNodeSpec<3>"*, %struct.Mat6*)

declare void @_ZN11MatrixTools7inverseI11FixedMatrixIdLi3ELi3ELi0ELi0EEEET_RKS3_NS_14InverseResultsINS3_10MatrixTypeEEE(%"struct.FixedMatrix<double,3,3,0,0>"* noalias sret, %"struct.FixedMatrix<double,3,3,0,0>"*, %"struct.MatrixTools::InverseResults<FullMatrix<double> >"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIdLi3ELi3EERSoS0_RK15FixedMatrixBaseIT_XT0_EXT1_EE(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.FixedMatrixBase<double,3,3>"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIdLi3ELi6EERSoS0_RK15FixedMatrixBaseIT_XT0_EXT1_EE(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.FixedMatrixBase<double,3,6>"*)

declare void @_Z7unitVecRK4Vec3(%struct.Vec3* noalias sret, %struct.Vec3*)

declare double @_Z4normIdLi3EET_RK11FixedVectorIS0_XT0_ELi0EE(%"struct.FixedMatrix<double,1,3,0,0>"*)

declare void @_ZN12HNodeTorsionC2EPK9HingeNodeRK4Vec3Ri(%struct.HNodeTorsion*, %struct.HingeNode*, %struct.Vec3*, i32*)

declare double @acos(double) nounwind readnone

declare double @atan2(double, double) nounwind readnone

declare void @_ZN21HNodeTranslateRotate2C2EPK9HingeNodeRi(%struct.HNodeTranslateRotate2*, %struct.HingeNode*, i32*)

declare void @_ZN13HingeNodeSpecILi2EE9calcPropsEv(%"struct.HingeNodeSpec<2>"*)

declare void @_ZN11MatrixTools9transposeI11FixedMatrixIdLi2ELi6ELi0ELi0EEEENT_13TransposeTypeERKS3_(%"struct.FixedMatrix<double,2,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,2,6,0,0>"*)

declare void @_Z10blockMat21IdLi1ELi3ELi1EE11FixedMatrixIT_XplT0_T2_EXT1_ELi0ELi0EERKS0_IS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT2_EXT1_ELi0ELi0EE(%"struct.FixedMatrix<double,1,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,1,3,0,0>"*, %"struct.FixedMatrix<double,1,3,0,0>"*)

declare void @_Z10blockMat12IdLi2ELi3ELi3EE11FixedMatrixIT_XT0_EXplT1_T2_ELi0ELi0EERKS0_IS1_XT0_EXT1_ELi0ELi0EERKS0_IS1_XT0_EXT2_ELi0ELi0EE(%"struct.FixedMatrix<double,2,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,1,6,0,0>"*, %"struct.FixedMatrix<double,1,6,0,0>"*)

declare void @_ZN13CDSMatrixBaseIdEC2I11FixedMatrixIdLi2ELi6ELi0ELi0EEEERKT_(%"struct.CDSMatrixBase<double>"*, %"struct.FixedMatrix<double,2,6,0,0>"*)

declare void @_ZN11MatrixTools9transposeI11FixedMatrixIdLi6ELi2ELi0ELi0EEEENT_13TransposeTypeERKS3_(%"struct.FixedMatrix<double,2,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,2,6,0,0>"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIdLi2EERSoS0_RK15FixedVectorBaseIT_XT0_EE(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.FixedVectorBase<double,2>"*)

declare %"struct.FixedMatrixBase<double,1,3>"* @_ZN15FixedVectorBaseIdLi3EEdVERKd(%"struct.FixedMatrixBase<double,1,3>"*, double*)

declare %"struct.FixedMatrixBase<double,1,3>"* @_ZN15FixedVectorBaseIdLi3EEmIERKS0_(%"struct.FixedMatrixBase<double,1,3>"*, %"struct.FixedMatrixBase<double,1,3>"*)

declare void @_ZN11FixedVectorIdLi3ELi0EE6subColILi6ELi2ELi0ELi0EEES0_RK11FixedMatrixIdXT_EXT0_EXT1_EXT2_EEiii(%"struct.FixedMatrix<double,1,3,0,0>"* noalias sret, %"struct.FixedMatrix<double,2,6,0,0>"*, i32, i32, i32)

declare void @_ZN13HingeNodeSpecILi2EE7calcD_GERK11FixedMatrixIdLi6ELi6ELi0ELi0EE(%"struct.HingeNodeSpec<2>"*, %struct.Mat6*)

declare void @_ZN11MatrixTools7inverseI11FixedMatrixIdLi2ELi2ELi0ELi0EEEET_RKS3_NS_14InverseResultsINS3_10MatrixTypeEEE(%"struct.FixedMatrix<double,2,2,0,0>"* noalias sret, %"struct.FixedMatrix<double,2,2,0,0>"*, %"struct.MatrixTools::InverseResults<FullMatrix<double> >"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIdLi2ELi2EERSoS0_RK15FixedMatrixBaseIT_XT0_EXT1_EE(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.FixedMatrixBase<double,2,2>"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIdLi2ELi6EERSoS0_RK15FixedMatrixBaseIT_XT0_EXT1_EE(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.FixedMatrixBase<double,2,6>"*)

declare zeroext i8 @_ZNK9CDSStringIcE7matchesEPKcb(%struct.String*, i8*, i8 zeroext)

declare %struct.HingeNode* @_Z9constructP9HingeNodeRKN16InternalDynamics9HingeSpecERi(%struct.HingeNode*, %"struct.InternalDynamics::HingeSpec"*, i32*)

declare void @_ZN9CDSStringIcEC1ERKS0_(%struct.String*, %struct.String*)

declare void @_ZN9CDSStringIcE8downcaseEv(%struct.String*)

declare %struct.String* @_ZN9CDSStringIcEaSEPKc(%struct.String*, i8*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIP7IVMAtomERSoS2_RK7CDSListIT_E(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %struct.AtomList*)

declare i32 @_ZNK7CDSListIP9HingeNodeE8getIndexERKS1_(%"struct.CDSList<HingeNode*>"*, %struct.HingeNode**)

declare void @_ZN13CDSMatrixBaseIdEC2I11FixedMatrixIdLi6ELi6ELi0ELi0EEEERKT_(%"struct.CDSMatrixBase<double>"*, %struct.Mat6*)

declare void @_ZN11FixedVectorIdLi3ELi0EE6subColILi6ELi6ELi0ELi0EEES0_RK11FixedMatrixIdXT_EXT0_EXT1_EXT2_EEiii(%"struct.FixedMatrix<double,1,3,0,0>"* noalias sret, %struct.Mat6*, i32, i32, i32)

declare void @_ZN13HingeNodeSpecILi6EE7calcD_GERK11FixedMatrixIdLi6ELi6ELi0ELi0EE(%"struct.HingeNodeSpec<6>"*, %struct.Mat6*)

declare void @_ZN11MatrixTools7inverseI11FixedMatrixIdLi6ELi6ELi0ELi0EEEET_RKS3_NS_14InverseResultsINS3_10MatrixTypeEEE(%struct.Mat6* noalias sret, %struct.Mat6*, %"struct.MatrixTools::InverseResults<FullMatrix<double> >"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIdLi6ELi6EERSoS0_RK15FixedMatrixBaseIT_XT0_EXT1_EE(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.FixedMatrixBase<double,6,6>"*)

declare void @_ZN13HingeNodeSpecILi5EE9calcPropsEv(%"struct.HingeNodeSpec<5>"*)

declare void @_ZN11MatrixTools9transposeI11FixedMatrixIdLi5ELi6ELi0ELi0EEEENT_13TransposeTypeERKS3_(%"struct.FixedMatrix<double,5,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,5,6,0,0>"*)

declare void @_ZN13CDSMatrixBaseIdEC2I11FixedMatrixIdLi5ELi6ELi0ELi0EEEERKT_(%"struct.CDSMatrixBase<double>"*, %"struct.FixedMatrix<double,5,6,0,0>"*)

declare void @_ZN11MatrixTools9transposeI11FixedMatrixIdLi6ELi5ELi0ELi0EEEENT_13TransposeTypeERKS3_(%"struct.FixedMatrix<double,5,6,0,0>"* noalias sret, %"struct.FixedMatrix<double,5,6,0,0>"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIdLi5EERSoS0_RK15FixedVectorBaseIT_XT0_EE(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.FixedVectorBase<double,5>"*)

declare void @_ZN11FixedVectorIdLi3ELi0EE6subColILi6ELi5ELi0ELi0EEES0_RK11FixedMatrixIdXT_EXT0_EXT1_EXT2_EEiii(%"struct.FixedMatrix<double,1,3,0,0>"* noalias sret, %"struct.FixedMatrix<double,5,6,0,0>"*, i32, i32, i32)

declare void @_ZN13HingeNodeSpecILi5EE7calcD_GERK11FixedMatrixIdLi6ELi6ELi0ELi0EE(%"struct.HingeNodeSpec<5>"*, %struct.Mat6*)

declare void @_ZN11MatrixTools7inverseI11FixedMatrixIdLi5ELi5ELi0ELi0EEEET_RKS3_NS_14InverseResultsINS3_10MatrixTypeEEE(%"struct.FixedMatrix<double,5,5,0,0>"* noalias sret, %"struct.FixedMatrix<double,5,5,0,0>"*, %"struct.MatrixTools::InverseResults<FullMatrix<double> >"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIdLi5ELi5EERSoS0_RK15FixedMatrixBaseIT_XT0_EXT1_EE(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.FixedMatrixBase<double,5,5>"*)

declare %"struct.std::basic_ostream<char,std::char_traits<char> >"* @_ZlsIdLi5ELi6EERSoS0_RK15FixedMatrixBaseIT_XT0_EXT1_EE(%"struct.std::basic_ostream<char,std::char_traits<char> >"*, %"struct.FixedMatrixBase<double,5,6>"*)

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i1) nounwind
