import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../bloc/post_detail/post_detail_bloc.dart';

class PostDetailScreen extends StatelessWidget {
  final String id;
  const PostDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<PostDetailBloc>()..add(PostDetailEvent.load(id)),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text('Post'),
          actions: [
            // Edit action in the AppBar for quick access
            BlocBuilder<PostDetailBloc, PostDetailState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (post) => IconButton(
                    tooltip: 'Edit post',
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () async {
                      final r = await context.push<bool>(
                          '/posts/${post.id}/edit',
                          extra: post);
                      if (r == true && context.mounted) {
                        context
                            .read<PostDetailBloc>()
                            .add(PostDetailEvent.load(post.id));
                      }
                    },
                  ),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
            const SizedBox(width: 4),
          ],
        ),
        body: BlocBuilder<PostDetailBloc, PostDetailState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              loaded: (post) => _PostDetailBody(post: post),
              error: (msg) => _ErrorBody(message: msg),
            );
          },
        ),
      ),
    );
  }
}

// ── Detail body ───────────────────────────────────────────────────────────────

class _PostDetailBody extends StatelessWidget {
  final dynamic post; // Replace with your PostEntity type

  const _PostDetailBody({required this.post});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // ── Meta chip ─────────────────────────────────────
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.schedule_rounded,
                          size: 13,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          DateFormat('MMM dd, yyyy · HH:mm')
                              .format(post.createdAt.toLocal()),
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // ── Title ─────────────────────────────────────────
              Text(post.title, style: AppTextStyles.headlineLarge),
              const SizedBox(height: 20),

              // ── Divider ───────────────────────────────────────
              Container(
                height: 1,
                color: AppColors.border,
              ),
              const SizedBox(height: 20),

              // ── Content ───────────────────────────────────────
              SelectableText(
                post.description,
                style: AppTextStyles.bodyLarge.copyWith(height: 1.8),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

// ── Error body ────────────────────────────────────────────────────────────────

class _ErrorBody extends StatelessWidget {
  final String message;
  const _ErrorBody({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.errorLight,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.error_outline_rounded,
                color: AppColors.error,
                size: 30,
              ),
            ),
            const SizedBox(height: 16),
            Text('Failed to load post', style: AppTextStyles.headlineMedium),
            const SizedBox(height: 8),
            Text(
              message,
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              icon: const Icon(Icons.arrow_back_rounded, size: 18),
              label: const Text('Go Back'),
              onPressed: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}