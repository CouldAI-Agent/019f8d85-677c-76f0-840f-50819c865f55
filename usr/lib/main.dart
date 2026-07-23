import 'package:flutter/material.dart';

void main() {
  runApp(const PresentationApp());
}

class PresentationApp extends StatelessWidget {
  const PresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'عرض بسطامي والصاحب',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Directionality(
              textDirection: TextDirection.rtl,
              child: PresentationScreen(),
            ),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC31932), // Nissan/Bustami-like red
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Tajawal', // Assumes a nice Arabic font or falls back cleanly
      ),
    );
  }
}

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<SlideData> _slides = [
    SlideData(
      title: 'برنامج عملاء الولاء\nمجموعة بسطامي والصاحب',
      subtitle: 'استراتيجية بناء ولاء مستدام في قطاع السيارات',
      hook: '🔥 الهوك (The Hook): ماذا لو كانت سيارة العميل تعرف احتياجاته وتلبيها قبل حتى أن يفكر فيها؟ تخيل أن يتحول شراء سيارة من معاملة تجارية... إلى علاقة مدى الحياة!',
      content: 'مدة العرض: 30 دقيقة\nنقدم لكم اليوم رؤية شاملة لكيفية تحويل مشترين لمرة واحدة إلى سفراء دائمين لعلامتنا التجارية.',
      icon: Icons.auto_awesome,
    ),
    SlideData(
      title: 'إرث بسطامي والصاحب',
      subtitle: 'الثقة، الجودة، والموثوقية',
      hook: '',
      content: '• بصفتنا وكلاء حصريين لعلامات تجارية عالمية (نيسان وإنفينيتي) في الأردن.\n• بنينا تاريخاً طويلاً من الثقة مع المجتمع المحلي.\n• هدفنا الأساسي: تجاوز توقعات العملاء في كل نقطة اتصال (Touchpoint).',
      icon: Icons.history_edu,
    ),
    SlideData(
      title: 'لماذا الولاء هو استثمارنا الأهم؟',
      subtitle: 'المعادلة الرابحة',
      hook: '',
      content: '• التكلفة: تكلفة اكتساب عميل جديد تفوق تكلفة الحفاظ على عميل حالي بـ 5 إلى 7 أضعاف.\n• الربحية: زيادة نسبة الاحتفاظ بالعملاء (Retention Rate) بنسبة 5% قد تزيد الأرباح بنسبة تصل إلى 25% - 95%.\n• التسويق الشفهي: عميل الولاء هو أفضل مسوق لسياراتنا وخدماتنا.',
      icon: Icons.trending_up,
    ),
    SlideData(
      title: 'ركائز برنامج الولاء الخاص بنا',
      subtitle: 'ما الذي نقدمه لعملائنا المميزين؟',
      hook: '',
      content: '1. خدمات (VIP) لما بعد البيع: استقبال مخصص وصالة انتظار راقية.\n2. أولوية الحجز: مسار سريع لمواعيد الصيانة الدورية.\n3. الخصومات والمكافآت: أسعار تفضيلية على قطع الغيار الأصلية وأجور الصيانة.\n4. استبدال السيارات (Trade-in): تقييم تفضيلي عند رغبة العميل بتجديد سيارته.',
      icon: Icons.star,
    ),
    SlideData(
      title: 'رحلة العميل المتكاملة',
      subtitle: 'من الشراء إلى التجديد',
      hook: '',
      content: '• مرحلة الشراء: تجربة تسليم استثنائية (Delivery Experience).\n• مرحلة الاستخدام: متابعة دورية، تذكير بمواعيد الصيانة، وتهنئة بالمناسبات الشخصية.\n• مرحلة ما بعد الضمان: عروض مخصصة لإبقاء العميل داخل مظلة الوكالة.\n• مرحلة التجديد: عروض استباقية لاستبدال السيارة بعد 3-5 سنوات.',
      icon: Icons.route,
    ),
    SlideData(
      title: 'الرؤية المستقبلية (التحول الرقمي)',
      subtitle: 'مستقبل الولاء يبدأ هنا',
      hook: '',
      content: '• تطبيق ذكي للولاء: يتيح للعميل تتبع نقاطه ومواعيد صيانته بضغطة زر.\n• الذكاء الاصطناعي (AI): تحليل بيانات العميل لتوقع متى يحتاج لخدمة معينة أو سيارة جديدة.\n• تجارب حصرية: دعوات لحضور فعاليات إطلاق السيارات الجديدة أو تجارب قيادة خاصة (Test Drives) قبل الجميع.',
      icon: Icons.lightbulb,
    ),
    SlideData(
      title: 'الخلاصة والنقاش',
      subtitle: 'شكراً لاستماعكم',
      hook: '',
      content: 'عملاؤنا ليسوا مجرد أرقام في مبيعاتنا، بل هم شركاء في نجاحنا المستمر.\n\nنفتح الآن باب النقاش (10 دقائق مخصصة للأسئلة والإجابات).',
      icon: Icons.forum,
    ),
  ];

  void _nextPage() {
    if (_currentPage < _slides.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('بسطامي والصاحب - عرض الولاء'),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        shadowColor: Colors.black12,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _slides.length,
                itemBuilder: (context, index) {
                  return SlideWidget(
                    slide: _slides[index],
                    pageNumber: index + 1,
                    totalPages: _slides.length,
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -2))
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: _currentPage > 0 ? _prevPage : null,
                    icon: const Icon(Icons.arrow_back_ios, size: 16),
                    label: const Text('السابق'),
                  ),
                  Text(
                    'شريحة ${_currentPage + 1} من ${_slides.length}',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                  TextButton.icon(
                    onPressed: _currentPage < _slides.length - 1 ? _nextPage : null,
                    icon: const Icon(Icons.arrow_forward_ios, size: 16),
                    label: const Text('التالي'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SlideData {
  final String title;
  final String subtitle;
  final String hook;
  final String content;
  final IconData icon;

  SlideData({
    required this.title,
    required this.subtitle,
    required this.hook,
    required this.content,
    required this.icon,
  });
}

class SlideWidget extends StatelessWidget {
  final SlideData slide;
  final int pageNumber;
  final int totalPages;

  const SlideWidget({
    super.key,
    required this.slide,
    required this.pageNumber,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        slide.icon,
                        size: 48,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            slide.title,
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  height: 1.2,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            slide.subtitle,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                if (slide.hook.isNotEmpty) ...[
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          Theme.of(context).colorScheme.primary.withOpacity(0.02),
                        ],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ),
                      border: Border(
                        right: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 4,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      slide.hook,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            color: Colors.black87,
                          ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      slide.content,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 22,
                            height: 1.8,
                            color: Colors.black87,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
