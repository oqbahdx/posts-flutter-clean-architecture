import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/post_entity.dart';
import '../bloc/post_form/post_form_bloc.dart';

class PostFormScreen extends StatelessWidget {
  final PostEntity? post;
  const PostFormScreen({super.key, this.post});

  bool get isEdit => post != null;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PostFormBloc>(),
      child: _PostFormView(post: post),
    );
  }
}

class _PostFormView extends StatefulWidget {
  final PostEntity? post;
  const _PostFormView({this.post});

  @override
  State<_PostFormView> createState() => _PostFormViewState();
}

class _PostFormViewState extends State<_PostFormView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleCtrl;
  late final TextEditingController _descCtrl;

  bool get isEdit => widget.post != null;

  @override
  void initState() {
    super.initState();
    _titleCtrl = TextEditingController(text: widget.post?.title ?? '');
    _descCtrl = TextEditingController(text: widget.post?.description ?? '');
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final bloc = context.read<PostFormBloc>();
    if (isEdit) {
      bloc.add(PostFormEvent.submitUpdate(
        id: widget.post!.id,
        title: _titleCtrl.text.trim(),
        description: _descCtrl.text.trim(),
      ));
    } else {
      bloc.add(PostFormEvent.submitCreate(
        title: _titleCtrl.text.trim(),
        description: _descCtrl.text.trim(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Post' : 'New Post'),
      ),
      body: BlocConsumer<PostFormBloc, PostFormState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(Icons.check_circle_outline_rounded,
                          color: Colors.white, size: 18),
                      const SizedBox(width: 10),
                      Text(isEdit ? 'Post updated successfully' : 'Post created!'),
                    ],
                  ),
                  backgroundColor: AppColors.success,
                ),
              );
              context.pop(true);
            },
            failure: (msg) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(msg),
                backgroundColor: AppColors.error,
              ),
            ),
          );
        },
        builder: (context, state) {
          final submitting =
              state.maybeWhen(submitting: () => true, orElse: () => false);

          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── Helper text ─────────────────────────────────
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.lightbulb_outline_rounded,
                          size: 18,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            isEdit
                                ? 'Update the title or content below.'
                                : 'Write a clear title and a detailed description.',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── Title field ─────────────────────────────────
                  _FieldLabel(label: 'Title'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _titleCtrl,
                    maxLength: 200,
                    style: AppTextStyles.bodyLarge,
                    decoration: const InputDecoration(
                      hintText: 'Give your post a clear title…',
                      counterText: '',
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Title is required';
                      }
                      if (v.length > 200) return 'Maximum 200 characters';
                      return null;
                    },
                  ),
                  const SizedBox(height: 6),
                  _buildCharCounter(_titleCtrl, 200),
                  const SizedBox(height: 20),

                  // ── Description field ───────────────────────────
                  _FieldLabel(label: 'Description'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _descCtrl,
                    maxLength: 5000,
                    maxLines: 10,
                    minLines: 6,
                    style: AppTextStyles.bodyLarge,
                    decoration: const InputDecoration(
                      hintText: 'Write your post content here…',
                      alignLabelWithHint: true,
                      counterText: '',
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Description is required';
                      }
                      if (v.length > 5000) return 'Maximum 5000 characters';
                      return null;
                    },
                  ),
                  const SizedBox(height: 6),
                  _buildCharCounter(_descCtrl, 5000),
                  const SizedBox(height: 32),

                  // ── Submit ──────────────────────────────────────
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: submitting ? null : _submit,
                      child: submitting
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: Colors.white,
                              ),
                            )
                          : Text(isEdit ? 'Save Changes' : 'Publish Post'),
                    ),
                  ),

                  if (isEdit) ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () => context.pop(),
                        child: const Text('Discard Changes'),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCharCounter(TextEditingController ctrl, int max) {
    return ValueListenableBuilder(
      valueListenable: ctrl,
      builder: (_, __, ___) {
        final count = ctrl.text.length;
        final nearLimit = count > max * 0.8;
        return Align(
          alignment: Alignment.centerRight,
          child: Text(
            '$count / $max',
            style: AppTextStyles.labelSmall.copyWith(
              color: nearLimit ? AppColors.error : AppColors.inkLight,
            ),
          ),
        );
      },
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String label;
  const _FieldLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppTextStyles.bodyMedium.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.ink,
      ),
    );
  }
}