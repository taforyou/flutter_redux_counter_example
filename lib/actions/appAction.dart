class IncrementalAction {
  final int count;
  
  IncrementalAction(this.count);
  // คิดว่าเอาไว้ Define Previous state เฉยๆ นะ เดาๆ
  @override
  String toString() {
    return 'IncrementalAction{count: $count}';
  }
}